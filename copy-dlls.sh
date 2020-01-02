cp -r /mingw64/share/glib-2.0 distro/share/
cp /mingw64/bin/gdbus.exe distro/bin/
cp /mingw64/bin/gspawn*.exe distro/bin/
cp -r /mingw64/share/icons/hicolor distro/share/icons/
cp -r /mingw64/share/icons/Adwaita distro/share/icons/
for x in `cat required-dlls.txt`
do
echo $x
cp $x distro/bin/
done
cp -r  /mingw64/lib/gdk-pixbuf-2.0 distro/lib/
cp -r /mingw64/lib/gstreamer-1.0 distro/lib/
find distro/ -type f -name '*.a' -delete

