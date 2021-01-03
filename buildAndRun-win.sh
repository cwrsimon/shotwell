#!/bin/bash
source ./common-win.sh

# fire up ninja 
DESTDIR=$target ninja -C build install 

# prepare settings first
cp /mingw64/share/glib-2.0/schemas/org.gtk.Settings.FileChooser.gschema.xml $target/share/glib-2.0/schemas/
glib-compile-schemas $target/share/glib-2.0/schemas/ --targetdir=$target/share/glib-2.0/schemas/

cd $target/bin && ./shotwell.exe

