# https://stackoverflow.com/questions/36933527/powershell-start-process-wait-with-timeout-kill-and-get-exit-code
Write-Host "Hello World!"
# TODOS
# Nice-Level
# Make timeout configurable:
# https://stackoverflow.com/questions/12995767/can-i-set-powershell-start-job-with-low-priority
# [System.Threading.Thread]::CurrentThread.Priority = 'Lowest'
Write-Host $Args[0]
Write-Host $Args[1]
$programtorun = "../build/thumbnailer/shotwell-video-thumbnailer.exe"
$argumentlist = "small.mp4", $Args[1]
#"temp.png"
$proc = $null
$output = ""
$proc = Start-Process -FilePath $programtorun -ArgumentList $argumentlist -PassThru -WindowStyle hidden
# -PassThru -NoNewWindow

    # keep track of timeout event
    $timeouted = $null # reset any previously set timeout

    # wait up to x seconds for normal termination
    $proc | Wait-Process -Timeout 2 -ErrorAction SilentlyContinue -ErrorVariable timeouted

    if ($timeouted)
    {
        Write-Host "Killing process ..."

        # terminate the process
        $proc | kill

        # update internal error counter
    }
