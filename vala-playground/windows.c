#include <string.h>
#include <winnls.h>


char *
locale_get_timeformat ()
{
	char tmp[80];

	GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_STIMEFORMAT, (LPTSTR)&tmp, 80);

	return strdup(tmp);
}


char *
locale_get_decimal ()
{
	char tmp[4];
	GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, (LPTSTR)&tmp, 4);


	return strdup(tmp);
}
