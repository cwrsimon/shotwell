# Shotwell Photo Manager
----------------------

This fork of Shotwell aims to provide a documentation as well as a 
modified code base that allow to build and run Shotwell 0.30.7 
on Windows within a MINGW environment. 

Features currently not working / not compilable:
- publishers (webkit-gtk is not available in MSYS2 yet)

## Installing on Windows

1. Setup an MSYS2 environment on your machine:
http://www.msys2.org/

2. Update your environment:
```
pacman -Syu
```

3. Clone this git repository:
```
git clone https://github.com/cwrsimon/shotwell.git
```

4. Install the required packages from pkglist.txt:
```
pacman -S --needed - < required-packages.txt
```


5. Fire up meson and ninja:
cd shotwell
meson build
ninja -C build

6. Test the build:
cd build/src/
./shotwell.exe

7. Install to /mingw64:
ninja install
    
## Introduction
Shotwell is a digital photo manager designed for the GNOME desktop
environment.  It allows you to import photos from disk or camera,
organize them by keywords and events, view them in full-window or fullscreen
mode, and share them with others via social networking and more.

Visit https://wiki.gnome.org/Apps/Shotwell to read about the current state of
Shotwell's development and to make sure you're running the latest version.

## Installation & Licensing
Please consult the (INSTALL) and (COPYING) files for more information.
    
## Quick Start
    
There are three ways to import photos: via drag-and-drop, from a digital
camera, and from the File menu.
    
* Drag-and-drop: Simply drag photos from your file manager and drop them
onto the Shotwell window.  You may drag files or directories.  The photos
will be imported into the library.
    
* Camera: Connect your digital camera to your computer.  Shotwell will 
detect it and list it in the sidebar.  When you select the camera, Shotwell 
will load previews of each photo.  You may choose specific photos to 
import or to import them all. 
Shotwell uses gPhoto2 to communicate with digital cameras.  If your camera 
does not appear in Shotwell's sidebar or there is a problem importing
photos, visit http://www.gphoto.org to see if it is supported.
    
* File menu: Select File -> Import From Folder ... and select a directory
from the chooser dialog box.  Shotwell will scan the directory and all
sub-directories for photo files and automatically import them.
    
Once your photos are in Shotwell's library, you can view, edit, and export
them.  More features are planned, so check http://www.yorba.org/shotwell
regularly for updates.

    
Shotwell project page:      https://wiki.gnome.org/Apps/Shotwell
Shotwell documentation:     http://shotwell-project.org/doc/html/
    
We also encourage you to join the Shotwell mailing list. See
https://mail.gnome.org/mailman/listinfo/shotwell-list for how to subscribe
to the mailing list.

    Copyright 2016 Software Freedom Conservancy Inc.


