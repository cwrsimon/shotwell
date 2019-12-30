ldd distro/bin/*.exe | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp1.txt
ldd distro/bin/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp2.txt
ldd /mingw64/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp3.txt
ldd /mingw64/lib/gstreamer-1.0/*.dll | grep -i mingw | grep -P -o "/.*?.dll " | sort | uniq > tmp4.txt

cat tmp*.txt | sort|uniq



