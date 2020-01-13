#include <windows.h>

void 
set_priority_level_low () {
	// the best we can do to get Posix.nice (19) on Windows ...
	SetThreadPriority(GetCurrentThread(), THREAD_MODE_BACKGROUND_BEGIN);
}
