#!/bin/bash

unset EVAL_CKPT
unset ADAPTER
export OUTPUT_DIR="$1"
cd ~/StyleDrop-PyTorch

CUDA_VISIBLE_DEVICES="0" accelerate launch --num_processes 1 \
  --mixed_precision fp16 \
  train_t2i_custom_v2.py \
  --config=configs/custom.py
