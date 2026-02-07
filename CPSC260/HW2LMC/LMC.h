#ifndef LMC_H
#define LMC_H

#include<stdio.h>
#include<stdlib.h>

struct LMC{

    int accumulator;
    int mailboxes[100];
    int instructionCounter;
    int currentInstruction;
    int opcode, operand;
    int negativeFlag, zeroFlag;

    const char * opcodes[10];

    int debugMode;

};

extern struct LMC lmc;

void initializeLMC(int debugModeToggle);

void runProgram();

void fetch();

void decode();

void execute();

void printLMC();

void printMailboxes();

void loadProgram(const char * filename);

void readFromFile(const char * filename);

void writeToFile(const char * filename, const char * output);

#endif