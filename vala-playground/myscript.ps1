# https://stackoverflow.com/questions/36933527/powershell-start-process-wait-with-timeout-kill-and-get-exit-code
Write-Host "Hello World!"
$programtorun = "../build/thumbnailer/shotwell-video-thumbnailer.exe"
$argumentlist = "small.mp4"
$proc = $null
$output = ""
$proc = Start-Process -FilePath $programtorun -ArgumentList $argumentlist -PassThru -WindowStyle hidden -redirectstandardout bla.txt
# -PassThru -NoNewWindow

    # keep track of timeout event
#    $timeouted = $null # reset any previously set timeout

    # wait up to x seconds for normal termination
    $proc | Wait-Process -Timeout 13 -ErrorAction SilentlyContinue -ErrorVariable timeouted

    if ($timeouted)
    {
        # terminate the process
        $proc | kill

        # update internal error counter
    }
