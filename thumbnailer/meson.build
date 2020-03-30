windows_sources = []
if enableWindowsSupport
  windows_sources += ['windows.c']
endif
executable('shotwell-video-thumbnailer', [
            'shotwell-video-thumbnailer.vala'
           ] + windows_sources,
           dependencies : [posix, gstreamer, gee, gdk_pixbuf, gio],
	         gui_app : true,
           install : true,
           install_dir : join_paths(get_option('libexecdir'), 'shotwell'))
