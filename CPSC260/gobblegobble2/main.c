#include <stdio.h>
#include <stdint.h>


int main(){
    int x = 15;
    int y = -15;

    printf("Decimal: %d, Hex: %x\n", x , x);
    printf("Decimal: %d, Hex: %x\n", y , y);


    uint8_t g = 15;
    uint8_t h = -15;

    int8_t m = 15;
    int8_t n = -15;

    printf("Decimal: %d, Hex: %x\n", g , g);
    printf("Decimal: %d, Hex: %x\n", h , h);
    printf("Decimal: %d, Hex: %x\n", m , m);
    printf("Decimal: %d, Hex: %x\n", n , n);



    return 0;
}