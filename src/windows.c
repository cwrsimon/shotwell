// borrowed from:
// https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-gnome-calculator/001-win.patch

#include <string.h>
#include <winnls.h>
#include <shlobj.h>

char *
locale_get_decimal ()
{
	char tmp[4];
	GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, (LPTSTR)&tmp, 4);


	return strdup(tmp);
}

// borrowed from:
// https://stackoverflow.com/questions/47564192/shopenfolderandselectitems-with-arrays
void
openFileInExplorer(char *filename) {
ITEMIDLIST *idl = ILCreateFromPath(filename);
SHOpenFolderAndSelectItems(idl, 0, 0, 0);
ILFree(idl);
}
