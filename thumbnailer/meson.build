windows_sources = []
if enableWindowsSupport
  windows_sources += ['windows.c']
endif

executable('shotwell-video-thumbnailer', [
            'shotwell-video-thumbnailer.vala'
           ] + windows_sources,
           dependencies : [posix, gstreamer, gee, gdk_pixbuf],
           install : true)
