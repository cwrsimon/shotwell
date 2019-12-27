/* 
private static bool process_line (IOChannel channel, IOCondition condition, string stream_name) {
    if (condition == IOCondition.HUP) {
        stdout.printf ("%s: The fd has been closed.\n", stream_name);
        return false;
    }

    try {
        string line;
        channel.read_line (out line, null, null);
        stdout.printf ("%s: %s", stream_name, line);
    } catch (IOChannelError e) {
        stdout.printf ("%s: IOChannelError: %s\n", stream_name, e.message);
        return false;
    } catch (ConvertError e) {
        stdout.printf ("%s: ConvertError: %s\n", stream_name, e.message);
        return false;
    }

    return true;
}
*/

public static int main (string[] args) {
    //MainLoop loop = new MainLoop ();
    try {
        //  ../build/thumbnailer/shotwell-video-thumbnailer.exe
        string[] spawn_args = {"../build/thumbnailer/shotwell-video-thumbnailer.exe", 
     //   "/c/Users/cwrsi/Projects/shotwell/vala-playground/small.mp4"};
        "small.mp4"};

        string[] spawn_env = Environ.get ();
        Pid child_pid;

        int standard_output;

        Process.spawn_async_with_pipes (".",
        spawn_args,
        spawn_env,
        SpawnFlags.SEARCH_PATH ,
        //| SpawnFlags.DO_NOT_REAP_CHILD,
        null,
        out child_pid,
        null,
        out standard_output,
        null);

        // https://valadoc.org/glib-2.0/GLib.Process.html
        // https://valadoc.org/glib-2.0/GLib.Process.spawn_async_with_pipes.html
        // https://valadoc.org/glib-2.0/GLib.IOChannel.add_watch.html
        // stdout:
           IOChannel output = new IOChannel.win32_new_fd  (standard_output);
            output.set_encoding(null);
            StringBuilder contentBuilder = new StringBuilder();
           
            IOStatus status = IOStatus.NORMAL;
            while (status != IOStatus.EOF) {
             string line;
             status = output.read_line (out line, null, null);
             if (line == null) {
                 print("null\n");
                 continue;
             }
             print("%d\n", line.length);
             contentBuilder.append(line.strip());
            }
            print("%d", contentBuilder.str.length);

            File file = File.new_for_path ("bla.base64");
	try {
		FileIOStream stream = file.create_readwrite (FileCreateFlags.PRIVATE);
		stream.output_stream.write (contentBuilder.str.data);
	} catch (Error e) {
		print ("Error: %s\n", e.message);
	}

            var pngData = Base64.decode(contentBuilder.str);
            // FIXME close the stream
            Gdk.Pixbuf? buf = null;
            MemoryInputStream mis = new MemoryInputStream.from_data(pngData);
            buf = new Gdk.Pixbuf.from_stream(mis);
          // status =  output.read_to_end (out line, null);
          //  print ( line );
          // stdout.close();

        //IOChannel output = new IOChannel.unix_new  (standard_output);
  
        //output.add_watch (IOCondition.IN | IOCondition.HUP, (channel, condition) => {
        //    return process_line (channel, condition, "stdout");
        //});

       // ChildWatch.add_full ( Priority.DEFAULT_IDLE, child_pid, (pid, status) => {
         //   print( "%d", status);
            // Triggered when the child indicated by child_pid exits
        //    Process.close_pid (pid);
           // loop.quit ();
       // });

        //loop.run ();
    } catch (SpawnError e) {
        stderr.printf ("Error: %s\n", e.message);
    } catch (IOChannelError e) {
        stderr.printf ("IOChannelError: %s\n", e.message);
    }  catch (ConvertError e) {
        stderr.printf ("ConvertError: %s\n", e.message);
    }catch (Error e) {
        stderr.printf ("Error: %s\n", e.message);
    }

    return 0;
}
