#include <stdio.h>
#include <string.h>


void To_Upper(char *str);
  
int main() {
    char str[100];
    strcpy(str, "cs354 is awesome!");
    printf("Original string:   %s\n",str);
    To_Upper(str);
    printf("\n");
    printf("Upper case string: %s\n",str);
    return 0;
}



