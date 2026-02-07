#include <stdint.h>
#include <stdio.h>

/*little endian*/

int main(){

    uint32_t word = 0x0A0B0C0D;

    char * ptr = (char*)&word;

    for(int i = 0; i < 4; i++)
    {
        printf("%02x ", ptr[i]);
    }

    printf("\n");



    return 0;
}