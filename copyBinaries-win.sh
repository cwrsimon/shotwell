#!/bin/bash
source ./common-win.sh

export main_deps=`ldd $target/bin/*.exe | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq `
export dll_deps=`ldd $target/bin/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq `
export pixbuf_deps=`ldd /mingw64/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq `
export gstreamer_deps=`ldd /mingw64/lib/gstreamer-1.0/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq `

cp /mingw64/bin/gdbus.exe $target/bin/
cp /mingw64/bin/gspawn*.exe $target/bin/

for x in $main_deps$dll_deps$pixbuf_deps$gstreamer_deps
do
echo $x
cp $x $target/bin/
done

cp -r /mingw64/lib/gdk-pixbuf-2.0 $target/lib/
cp -r /mingw64/lib/gstreamer-1.0 $target/lib/
find $target -type f -name '*.a' -delete

# copy icons
grep -i -P "icon|symbolic" src/Resources.vala  | grep "public const string" | grep -o -P "\".*\"" | sed s/"\""/"\*"/g > icon-patterns.txt
grep -ir -P -o "icon_name.*?\".+?\"" src/*.vala | grep -P -o "\".+?\"" | sed s/"\""/"\*"/g >> icon-patterns.txt
echo "index.theme" >> icon-patterns.txt

rsync -avz --include "*/" --include-from=icon-patterns.txt --exclude "*" /mingw64/share/icons/Adwaita $target/share/icons/
rsync -avz --include "*/" --include-from=icon-patterns.txt --exclude "*" /mingw64/share/icons/hicolor $target/share/icons/

gtk-update-icon-cache-3.0.exe $target/share/icons/hicolor/
gtk-update-icon-cache-3.0.exe $target/share/icons/Adwaita/


# convert page files to html
for x in `ls -1d $target/share/help/*`
do
echo $x
cd $x/shotwell/ && /usr/bin/yelp-build html *.page
done
