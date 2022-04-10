

/***************************** Include Files *******************************/
#include "radio_tuner.h"
//the one that is good update
/************************** Function Definitions ***************************/


void radioTuner_setAdcFreq(u32 BaseAddress, float freq){
    int phaseIncrement=getTuningWord(freq);
    RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_S00_AXI_SLV_REG1_OFFSET, phaseIncrement);
}

void radioTuner_tuneRadio(u32 BaseAddress, float tune_frequency) {
    int phaseIncrement=getTuningWord(tune_frequency);
    RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_S00_AXI_SLV_REG2_OFFSET, phaseIncrement);
}

// 1 = reset
void radioTuner_controlReset(u32 BaseAddress, u8 resetval){
    if(resetval>=1){
        resetval=1;
    }
    else{
        resetval=0;
    }
    RADIO_TUNER_mWriteReg(BaseAddress, RADIO_TUNER_S00_AXI_SLV_REG3_OFFSET, resetval);

}
//local functions for ease of use.
int getTuningWord(float frequency)
{
	double x= ((double)clkRate)/powf(2,phaseIncrementSize);

	double tuningWord=((double)frequency)/x;

	return roundLocal(tuningWord);

}


int roundLocal(double x)
{
    if (x < 0.0)
        return (int)(x - 0.5);
    else
        return (int)(x + 0.5);
}
