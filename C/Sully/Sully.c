#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// This program creates copies of itself with decremented counter

int main() {
    int i = 5;
    int x = i - 1;
    char *source = "#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c// This program creates copies of itself with decremented counter%c%cint main() {%cint i = %i;%cint x = i - 1;%cchar *source = %c%s%c;%c%c    if (i >= 0) {%c        char filename[32];%c        sprintf(filename, %cSully_%%d.c%c, x);%c        FILE *f = fopen(filename, %cw%c);%c        fprintf(f, source, 10,10,10,10,10,10,x,10,10,34,source,34,10,10,10,10,34,34,10,34,34,10,10,10,10,10,10,34,34,10,10,10,34,34,10,10,10,10,10,10,42,42,42,42,42,42,42,42,42,42,42,42,42);%c        fclose(f);%c%c        if (x >= 0) {%c            char compile_cmd[128];%c            sprintf(compile_cmd, %cclang -Wall -Wextra -Werror %%s -o Sully_%%d%c, filename, x);%c            system(compile_cmd);%c            char exec_cmd[32];%c            sprintf(exec_cmd, %c./Sully_%%d%c, x);%c            system(exec_cmd);%c        }%c    }%c    return 0;%c}%c";
    
    if (i >= 0) {
        char filename[32];
        sprintf(filename, "Sully_%d.c", x);
        FILE *f = fopen(filename, "w");
        fprintf(f, source, 10,10,10,10,10,10,x,10,10,34,source,34,10,10,10,10,34,34,10,34,34,10,10,10,10,10,10,34,34,10,10,10,34,34,10,10,10,10,10,10,42,42,42,42,42,42,42,42,42,42,42,42,42);
        fclose(f);
        
        if (x >= 0) {
            char compile_cmd[128];
            sprintf(compile_cmd, "clang -Wall -Wextra -Werror %s -o Sully_%d", filename, x);
            system(compile_cmd);
            char exec_cmd[32];
            sprintf(exec_cmd, "./Sully_%d", x);
            system(exec_cmd);
        }
    }
    return 0;
}
