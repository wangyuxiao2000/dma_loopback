# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# ==============================================================
proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "XDma_grabber_dma_grabber" \
        "NUM_INSTANCES" \
        "DEVICE_ID" \
        "C_S_AXI_DMA_GRABBER_CONTROL_BASEADDR" \
        "C_S_AXI_DMA_GRABBER_CONTROL_HIGHADDR"

    xdefine_config_file $drv_handle "xdma_grabber_dma_grabber_g.c" "XDma_grabber_dma_grabber" \
        "DEVICE_ID" \
        "C_S_AXI_DMA_GRABBER_CONTROL_BASEADDR"

    xdefine_canonical_xpars $drv_handle "xparameters.h" "XDma_grabber_dma_grabber" \
        "DEVICE_ID" \
        "C_S_AXI_DMA_GRABBER_CONTROL_BASEADDR" \
        "C_S_AXI_DMA_GRABBER_CONTROL_HIGHADDR"
}

