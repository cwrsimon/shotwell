

public static int main (string[] args) {
    //MainLoop loop = new MainLoop ();
    try {
        //  ../build/thumbnailer/shotwell-video-thumbnailer.exe
       // string[] spawn_args = {"../build/thumbnailer/shotwell-video-thumbnailer.exe", 
        string[] spawn_args = {"powershell",
        "-executionpolicy", "bypass", "-file", "myscript.ps1", 
        "../build/thumbnailer/shotwell-video-thumbnailer.exe",
        "C:\\Users\\cwrsi\\Projects\\shotwell\\vala-playground\\small.mp4",
        "output.png",
        "5"
        };

        string[] spawn_env = Environ.get ();
        //Pid child_pid;
        int ls_status;

        //int standard_output;

        Process.spawn_sync (".",
        spawn_args,
        spawn_env,
        SpawnFlags.SEARCH_PATH,
        null,
        null,
        null,
        out ls_status);

        print("%d", ls_status);

          
    } catch (SpawnError e) {
        stderr.printf ("Error: %s\n", e.message);
    }
    //catch (Error e) {
    //    stderr.printf ("Error: %s\n", e.message);
    //}

    return 0;
}
