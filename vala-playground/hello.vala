using Posix;
using Intl;

void main () {
    
    print ("Hello World\n");

	Intl.setlocale(LocaleCategory.ALL, "");

   // de_DE: %T
   // en_US: %r
   unowned string bla = Posix.nl_langinfo (Posix.NLItem.T_FMT);
   print (bla); print ("\n"); 

   // de_DE: ,
   // en_US: .
   unowned string radix = Posix.nl_langinfo (Posix.NLItem.RADIXCHAR);
   print (radix); print ("\n");

    time_t original_time = time_t();
//    Time.local(original_time);

    print( Time.local(original_time)
		.to_string() );
}

