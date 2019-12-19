using Intl;

extern string locale_get_decimal  ();
extern string locale_get_timeformat ();

void main () {
    


    print ("Hello World\n");

	//Intl.setlocale(LocaleCategory.ALL, "");

	string tsep_string = locale_get_decimal ();

	print (tsep_string); print("\n");

	string timeformat = locale_get_timeformat ();

	print (timeformat); print ("\n");
	
	time_t original_time = time_t();
	Time t = Time.local(original_time);

    print( t.format( "%H:%M:%S" ) ); print ("\n");
    print( t.format( "%X" ) ); print ("\n");
    print( t.to_string() );

	
}

