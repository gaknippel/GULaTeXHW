#include "LMC.h"

struct LMC lmc;

void initializeLMC(int debugModeToggle){

    lmc.opcodes[0] = "HLT";
    lmc.opcodes[1] = "ADD";
    lmc.opcodes[2] = "SUB";
    lmc.opcodes[3] = "STA";
    lmc.opcodes[4] = "UNUSED";
    lmc.opcodes[5] = "LDA";
    lmc.opcodes[6] = "BRA";
    lmc.opcodes[7] = "BRZ";
    lmc.opcodes[8] = "BRP";
    lmc.opcodes[9] = "INP/OUT";

    lmc.zeroFlag = 1;
    lmc.negativeFlag = 0;
    lmc.accumulator = 0;

    lmc.debugMode = debugModeToggle;
    
}

void loadProgram(const char * filename){

    FILE * file = fopen(filename, "r");

    if(file == NULL){
        printf("Error opening file [%s]! Program terminating...\n", filename);
        exit(0);
    }else{
        printf("Successfully opened file [%s].\n", filename);
    }

    // a string that can hold 5 characters
    // captures null terminator '\0' and newline char
    char line[5];
    int mailboxCounter = 0;
    while(fgets(line, 5, file) != NULL){
        line[3] = '\0'; //end string with a null terminator
        lmc.mailboxes[mailboxCounter++] = atoi(line);
    }

    fclose(file);

}

void runProgram(){ 

    if(lmc.debugMode == 1){
        printLMC();
        printMailboxes();
    }

    while(1){
        fetch();
        decode();
        execute();

        if(lmc.debugMode == 1){
            printf("\nPress enter to continue...\n");
            getchar();  // pauses the program until the user presses <enter>
        }
    }
}

void fetch(){ 

    if(lmc.debugMode == 1){
        printf("fetching instruction: %2d\n", lmc.instructionCounter);
    }

    lmc.currentInstruction = lmc.mailboxes[lmc.instructionCounter];
    
    lmc.instructionCounter++;
    //get next instruction from mailbox at instruction counter
    //increment instruction counter


}

void decode(){ 
    //convert the three-digit instruction into a task to do
    lmc.opcode = lmc.currentInstruction / 100; //gets first digit of 3 digit instruction
    lmc.operand = lmc.currentInstruction % 100; //gets remainder, or last 2 digits of instruction
    //get opcode and operand
    

    //debug print out
    if(lmc.debugMode == 1){
        printf("opcode: %d (%s), operand: %2d\n", lmc.opcode, lmc.opcodes[lmc.opcode], lmc.operand);
    }
}

void execute(){ 

    //perform the task of the the opcode and operand
    switch(lmc.opcode){
        case 0: //halt
        printf("exiting program...\n");
        exit(0);
            break;
        case 1: //add
        lmc.accumulator += lmc.mailboxes[lmc.operand];
            break;
        case 2: //subtract
        lmc.accumulator -= lmc.mailboxes[lmc.operand];
            break;
        case 3: //store
        lmc.mailboxes[lmc.operand] = lmc.accumulator;
            break;
        case 5: //load
        lmc.accumulator = lmc.mailboxes[lmc.operand];
            break;
        case 6: //branch
        lmc.instructionCounter = lmc.operand;
            break;
        case 7: //branch if zero
        if(lmc.zeroFlag == 1){
            lmc.instructionCounter = lmc.operand;
        }
            break;
        case 8: //branch if pos
        if(lmc.negativeFlag == 0){
            lmc.instructionCounter = lmc.operand;
        }
            break;
        case 9:
            // IO case already completed
            if(lmc.operand == 1){
                printf("Enter input and press enter: ");
                scanf("%d", &lmc.accumulator);
                getchar(); // remove the newline char
            }else if(lmc.operand == 2){
                printf("Output: %3d\n", lmc.accumulator);
            }
            break;
    };

    /*************************/
    //set flags here
    /*************************/
    if(lmc.accumulator == 0)
    {
        lmc.zeroFlag = 1;
    }
    else
    {
        lmc.zeroFlag = 0;
    }
    
    if(lmc.accumulator < 0)
    {
        lmc.negativeFlag = 1;
    }
    else
    {
        lmc.negativeFlag = 0;
    }


    if(lmc.debugMode == 1){
        
        printMailboxes();
        printLMC();
    }
    
}

void printLMC(){ 

    printf("+------------- LMC -------------+\n");
    printf("| Accumulator: [%3d]            |\n", lmc.accumulator);
    printf("| Instruction Counter: [%2d]     |\n", lmc.instructionCounter);
    printf("| Flags:                        |\n");
    printf("|   Negative Flag: %d            |\n", lmc.negativeFlag);
    printf("|   Zero Flag %d                 |\n", lmc.zeroFlag);
    printf("+-------------------------------+\n");
}

void printMailboxes(){
    printf("\nMemory Contents [mailbox:data]");
    for(int i = 0; i < 100; i++){
        if(i % 10 == 0){
            printf("\n");
        }
        printf("[%2d:%3d] ", i, lmc.mailboxes[i]);
    }
    printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

