#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define SOURCE "#include <stdio.h>%c#define FILENAME %cGrace_kid.c%c%c#define SOURCE %c%s%c%c#define MAIN() int main(){FILE*f=fopen(FILENAME,%cw%c);fprintf(f,SOURCE,10,34,34,10,34,SOURCE,34,10,34,34,10,10,10,10,10);fclose(f);return 0;}%c/*%c    This program will create a copy of its own source when run.%c*/%cMAIN()%c"
#define MAIN() int main(){FILE*f=fopen(FILENAME,"w");fprintf(f,SOURCE,10,34,34,10,34,SOURCE,34,10,34,34,10,10,10,10,10);fclose(f);return 0;}
/*
    This program will create a copy of its own source when run.
*/
MAIN()
