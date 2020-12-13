rsync -avz --include "*/" --include-from=icon-patterns.txt --exclude "*" /mingw64/share/icons/Adwaita distro/share/icons/
gtk-update-icon-cache-3.0.exe $DESTDIR/share/icons/hicolor/
gtk-update-icon-cache-3.0.exe $DESTDIR/share/icons/Adwaita/
