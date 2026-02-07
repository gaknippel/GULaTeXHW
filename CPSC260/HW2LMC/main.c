#include "LMC.h"

int main(int argc, char *argv[]){

    initializeLMC(0);   //0 is debug mode off, 1 is debug mode on. Set to 0 for final submission.
    loadProgram(argv[1]);    //input parameter is the file containing the lmc program
    runProgram();

    return 0;
}