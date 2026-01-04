#include <stdio.h>
#include <stdlib.h>
#include "klee/klee.h"

void f(){
    char * p = malloc(100);
    //char const *p_end = p+8192;
    //char * bp = p;
    //int x;
    //klee_make_symbolic(&x, 4, "x");
    //p = argv[1];
    //while(1){
    //bp++;
    if (p > 100){
        printf("1st path\n");
        //abort();
    }
   else{
        printf("2nd path\n");
        //abort();
   }

}

int main(int argc, char** argv){
    /*
    char * p = malloc(100);
    char *const p_end = p+4;
    char * bp = p;
    //int x;
    //klee_make_symbolic(&x, 4, "x");
    //p = argv[1];

    if (p_end -4  < bp+1){
        printf("1st path\n");
        abort();
    }
    else{
        printf("2nd path\n");
        abort();
    }
    printf("p = %s\n", p);
    */
    f();
    return 0;
}
