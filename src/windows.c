// borrowed from:
// https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-gnome-calculator/001-win.patch

#include <string.h>
#include <winnls.h>

char *
locale_get_decimal ()
{
	char tmp[4];
	GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, (LPTSTR)&tmp, 4);


	return strdup(tmp);
}
