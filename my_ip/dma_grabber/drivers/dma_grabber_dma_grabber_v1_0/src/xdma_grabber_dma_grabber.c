// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdma_grabber_dma_grabber.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDma_grabber_dma_grabber_CfgInitialize(XDma_grabber_dma_grabber *InstancePtr, XDma_grabber_dma_grabber_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Dma_grabber_control_BaseAddress = ConfigPtr->Dma_grabber_control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDma_grabber_dma_grabber_Set_en(XDma_grabber_dma_grabber *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDma_grabber_dma_grabber_WriteReg(InstancePtr->Dma_grabber_control_BaseAddress, XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_EN_DATA, Data);
}

u32 XDma_grabber_dma_grabber_Get_en(XDma_grabber_dma_grabber *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDma_grabber_dma_grabber_ReadReg(InstancePtr->Dma_grabber_control_BaseAddress, XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_EN_DATA);
    return Data;
}

void XDma_grabber_dma_grabber_Set_size(XDma_grabber_dma_grabber *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDma_grabber_dma_grabber_WriteReg(InstancePtr->Dma_grabber_control_BaseAddress, XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XDma_grabber_dma_grabber_Get_size(XDma_grabber_dma_grabber *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDma_grabber_dma_grabber_ReadReg(InstancePtr->Dma_grabber_control_BaseAddress, XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

