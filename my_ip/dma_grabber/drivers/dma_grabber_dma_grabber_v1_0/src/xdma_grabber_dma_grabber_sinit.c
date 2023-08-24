// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdma_grabber_dma_grabber.h"

extern XDma_grabber_dma_grabber_Config XDma_grabber_dma_grabber_ConfigTable[];

XDma_grabber_dma_grabber_Config *XDma_grabber_dma_grabber_LookupConfig(u16 DeviceId) {
	XDma_grabber_dma_grabber_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDMA_GRABBER_DMA_GRABBER_NUM_INSTANCES; Index++) {
		if (XDma_grabber_dma_grabber_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDma_grabber_dma_grabber_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDma_grabber_dma_grabber_Initialize(XDma_grabber_dma_grabber *InstancePtr, u16 DeviceId) {
	XDma_grabber_dma_grabber_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDma_grabber_dma_grabber_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDma_grabber_dma_grabber_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

