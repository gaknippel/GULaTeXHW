#include <stdio.h>
#include <stdbool.h>


int main() {

    int size = sizeof(char);
    printf("char is: %d byte\n", size);

    size = sizeof(bool);
    printf("bool is : %d byte\n", size);

    size = sizeof(int);
    printf("int is: %d bytes\n", size);

    size = sizeof(float);
    printf("float is : %d bytes\n", size);

    size = sizeof(double);
    printf("double is: %d bytes\n", size);


    int instruction = 504;

    int opcode = instruction / 100;

    printf("opcode is: %d \n", opcode);

    int operand = instruction % 100;

    printf("operand is: %d \n", operand);


    return 0;
}