    
    // Used by thumbnailer() to kill the external process if need be.
    public static bool on_thumbnailer_timer() {
        print("Thumbnailer timer called\n");
             //  if (thumbnailer_pid != 0) {
        //    debug("Killing thumbnailer process: %d", thumbnailer_pid);
//#if VALA_0_40
         //   Posix.kill(thumbnailer_pid, Posix.Signal.KILL);
           //          Posix.kill(thumbnailer_pid, 9);

//#else
  //          Posix.kill(thumbnailer_pid, Posix.SIGKILL);
// Use this windows equivalent:
//taskkill /PID process_id
  //          Posix.kill(thumbnailer_pid, 9);

//#endif
  //      }
        return false; // Don't call again.
    }
    

public static int main (string[] args) {
    //MainLoop loop = new MainLoop ();
    try {
        //  ../build/thumbnailer/shotwell-video-thumbnailer.exe
       // string[] spawn_args = {"../build/thumbnailer/shotwell-video-thumbnailer.exe", 
        string[] spawn_args = {"powershell",
        "-executionpolicy", "bypass", "-file", "myscript.ps1", 

        //   "/c/Users/cwrsi/Projects/shotwell/vala-playground/small.mp4"};
        "small.mp4"};

        Timeout.add_seconds_full(Priority.HIGH, 2, on_thumbnailer_timer);

        string[] spawn_env = Environ.get ();
        Pid child_pid;

        int standard_output;

        Process.spawn_async_with_pipes (".",
        spawn_args,
        spawn_env,
        SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
        null,
        out child_pid,
        null,
        out standard_output,
        null);

      Pid pid2;
  //      int pid = (int) child_pid;
        print("%s\n", child_pid.to_string());
        /* 
        Process.spawn_async_with_pipes (".",
        {"taskkill", "/PID", child_pid.to_string()},
        spawn_env,
        SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
        null,
        out pid2,
        null,
        null,
        null);
*/

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
            mis.close();

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
