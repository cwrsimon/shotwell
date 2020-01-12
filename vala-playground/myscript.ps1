# Expected arguments:
# $Args[0] path to shotwell-video-thumbnailer
# $Args[1] video file
# $Args[2] output file
# $Args[3] timeout in seconds
# Windows' equivalent for Posix.nice (19) ;-)
# https://stackoverflow.com/questions/12995767/can-i-set-powershell-start-job-with-low-priority
[System.Threading.Thread]::CurrentThread.Priority = 'Lowest'
Write-Host $Args[0]
Write-Host $Args[1]
Write-Host $Args[2]
Write-Host $Args[3]

#$programtorun = "../build/thumbnailer/shotwell-video-thumbnailer.exe"
$executable = $Args[0]
$argumentlist = $Args[1], $Args[2]

$proc = Start-Process -FilePath $executable -ArgumentList $argumentlist -PassThru -WindowStyle hidden
#  -NoNewWindow
   
# keep track of timeout event
$timeouted = $null

# https://stackoverflow.com/questions/36933527/powershell-start-process-wait-with-timeout-kill-and-get-exit-code
# wait up to x seconds for normal termination
$proc | Wait-Process -Timeout $Args[3] -ErrorAction SilentlyContinue -ErrorVariable timeouted

if ($timeouted)
{
        #Write-Host "Timeout occurred ..."
        $proc | kill

        exit 9
}
Write-Host $proc.ExitCode
exit $proc.ExitCode
