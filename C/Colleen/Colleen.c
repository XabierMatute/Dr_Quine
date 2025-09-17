#include <stdio.h>

/*
    This program will print its own source when run.
*/

int print_source() {
    char *source = "#include <stdio.h>%c%c/*%c    This program will print its own source when run.%c*/%c%cint print_source() {%c    char *source = %c%s%c;%c    return (printf(source, 10, 10, 10, 10, 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10));%c}%c%cint main() {%c    /*%c        This function prints the source code%c    */%c    print_source();%c    return 0;%c}%c";
    return (printf(source, 10, 10, 10, 10, 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10));
}

int main() {
    /*
        This function prints the source code
    */
    print_source();
    return 0;
}
