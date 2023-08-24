// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDMA_GRABBER_DMA_GRABBER_H
#define XDMA_GRABBER_DMA_GRABBER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdma_grabber_dma_grabber_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Dma_grabber_control_BaseAddress;
} XDma_grabber_dma_grabber_Config;
#endif

typedef struct {
    u64 Dma_grabber_control_BaseAddress;
    u32 IsReady;
} XDma_grabber_dma_grabber;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDma_grabber_dma_grabber_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDma_grabber_dma_grabber_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDma_grabber_dma_grabber_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDma_grabber_dma_grabber_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XDma_grabber_dma_grabber_Initialize(XDma_grabber_dma_grabber *InstancePtr, u16 DeviceId);
XDma_grabber_dma_grabber_Config* XDma_grabber_dma_grabber_LookupConfig(u16 DeviceId);
int XDma_grabber_dma_grabber_CfgInitialize(XDma_grabber_dma_grabber *InstancePtr, XDma_grabber_dma_grabber_Config *ConfigPtr);
#else
int XDma_grabber_dma_grabber_Initialize(XDma_grabber_dma_grabber *InstancePtr, const char* InstanceName);
int XDma_grabber_dma_grabber_Release(XDma_grabber_dma_grabber *InstancePtr);
#endif


void XDma_grabber_dma_grabber_Set_en(XDma_grabber_dma_grabber *InstancePtr, u32 Data);
u32 XDma_grabber_dma_grabber_Get_en(XDma_grabber_dma_grabber *InstancePtr);
void XDma_grabber_dma_grabber_Set_size(XDma_grabber_dma_grabber *InstancePtr, u32 Data);
u32 XDma_grabber_dma_grabber_Get_size(XDma_grabber_dma_grabber *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
