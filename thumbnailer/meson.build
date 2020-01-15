windows_sources = []
if enableWindowsSupport
  windows_sources += ['windows.c']
endif
# TODO Macht es einen Unterschied,
# wenn der Thumbnailer eine GUI-App ist??ß
executable('shotwell-video-thumbnailer', [
            'shotwell-video-thumbnailer.vala'
           ] + windows_sources,
           dependencies : [posix, gstreamer, gee, gdk_pixbuf],
	   gui_app : true,
           install : true)
