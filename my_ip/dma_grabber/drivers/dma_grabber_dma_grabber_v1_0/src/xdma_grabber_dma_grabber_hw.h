// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// dma_grabber_control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of en
//        bit 0  - en[0] (Read/Write)
//        others - reserved
// 0x14 : reserved
// 0x18 : Data signal of size
//        bit 15~0 - size[15:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_EN_DATA   0x10
#define XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_BITS_EN_DATA   1
#define XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_ADDR_SIZE_DATA 0x18
#define XDMA_GRABBER_DMA_GRABBER_DMA_GRABBER_CONTROL_BITS_SIZE_DATA 16

