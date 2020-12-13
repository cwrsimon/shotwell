ldd distro/bin/*.exe | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp1.txt
ldd distro/bin/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp2.txt
ldd /mingw64/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp3.txt
ldd /mingw64/lib/gstreamer-1.0/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp4.txt

cat tmp*.txt | sort|uniq

grep -i -P "icon|symbolic" src/Resources.vala  | grep "public const string" | grep -o -P "\".*\"" | sed s/"\""/"\*"/g > icon-patterns.txt
grep -ir -P -o "icon_name.*?\".+?\"" src/*.vala | grep -P -o "\".+?\"" | sed s/"\""/"\*"/g >> icon-patterns.txt
echo "icon.theme" >> icon-patterns.txt

