#!/usr/bin/env bash


CURRENT_PATH=$(pwd)
echo $CURRENT_PATH

mkdir -p data


export nnUNet_raw="${CURRENT_PATH}/data/nnUNet_raw"
export nnUNet_preprocessed="${CURRENT_PATH}/data/nnUNet_preprocessed"
export nnUNet_results="${CURRENT_PATH}/data/nnUNet_results"

mkdir -p ${nnUNet_raw}/Dataset001_oaizib
mkdir -p ${nnUNet_preprocessed}
mkdir -p ${nnUNet_results}

cp ${CURRENT_PATH}/config/dataset.json ${nnUNet_raw}/Dataset001_oaizib


pip install torch torchvision
pip install nnunetv2
pip install --upgrade git+https://github.com/FabianIsensee/hiddenlayer.git
