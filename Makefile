
TARGET = shotwell

# This takes care of a warning message generated by the use of Math.round in image_util.vala
VALAC_OPTS =--Xcc=-std=c99 -g --enable-checking

SRC_FILES = \
	main.vala \
	AppWindow.vala \
	CollectionPage.vala \
	Thumbnail.vala \
	DatabaseTables.vala \
	ThumbnailCache.vala \
	image_util.vala \
	CollectionLayout.vala \
	PhotoPage.vala \
	Exif.vala \
	Page.vala \
	ImportPage.vala \
	GPhoto.vala \
	SortedList.vala \
	EventsDirectoryPage.vala
	
VAPI_FILES = \
	libexif.vapi \
	fstream.vapi \
	libgphoto2.vapi

RESOURCE_FILES = \
	photo.ui \
	collection.ui \
	import.ui

HEADER_FILES = \
	gphoto.h
    
VAPI_DIRS = \
	.

HEADER_DIRS = \
	.

LOCAL_PKGS = \
	libexif \
	fstream \
	libgphoto2 \

EXT_PKGS = \
	gtk+-2.0 \
	sqlite3 \
	vala-1.0 \
	hal \
	dbus-glib-1 \
	unique-1.0

PKGS = $(EXT_PKGS) $(LOCAL_PKGS)

all: $(TARGET)

clean:
	rm -f $(TARGET)

install: $(TARGET) shotwell.desktop
	cp $(TARGET) /usr/local/bin
	mkdir -p /usr/local/share/shotwell/icons
	cp icons/* /usr/local/share/shotwell/icons
	$(foreach res,$(RESOURCE_FILES),cp $(res) /usr/local/share/shotwell;)
	cp shotwell.desktop /usr/share/applications

uninstall:
	rm -f /usr/local/bin/$(TARGET)
	rm -fr /usr/local/share/shotwell
	rm -f /usr/share/applications/shotwell.desktop

$(TARGET): $(SRC_FILES) $(VAPI_FILES) $(HEADER_FILES) Makefile
	pkg-config --print-errors --exists $(EXT_PKGS)
	valac $(VALAC_OPTS) \
	$(foreach pkg,$(PKGS),--pkg=$(pkg)) \
	$(foreach vapidir,$(VAPI_DIRS), --vapidir=$(vapidir)) \
	$(foreach hdir,$(HEADER_DIRS),-X -I$(hdir)) \
	$(SRC_FILES) \
	-o $(TARGET)

