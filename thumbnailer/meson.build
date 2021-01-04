windows_sources = []
target_dir = join_paths(get_option('libexecdir'), 'shotwell')
if enableWindowsSupport
  windows_sources += ['windows.c']
  target_dir = get_option('bindir')
endif
executable('shotwell-video-thumbnailer', [
            'shotwell-video-thumbnailer.vala'
           ] + windows_sources,
           dependencies : [posix, gstreamer, gee, gdk_pixbuf, gio],
	         gui_app : true,
           install : true,
           install_dir : target_dir)
