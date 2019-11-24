using Posix;

void main () {
    
    print ("Hello World\n");

    unowned string bla = Posix.nl_langinfo (Posix.NLItem.T_FMT);
    print (bla); print ("\n");
    unowned string radix = Posix.nl_langinfo (Posix.NLItem.RADIXCHAR);
    print (radix); print ("\n");

    time_t original_time = time_t();
//    Time.local(original_time);

    print( Time.local(original_time)
		.to_string() );
}

