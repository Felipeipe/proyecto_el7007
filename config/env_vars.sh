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

# dependencies
pip install torch torchvision
pip install nnunetv2
pip install --upgrade git+https://github.com/FabianIsensee/hiddenlayer.git

# dataset configuration
cd ${nnUNet_raw}/Dataset001_oaizib
gdown --folder "https://drive.google.com/drive/folders/1hrTVO5CikLl2s5zLRynJJUmXIzzkdbc-"
rm -rf OAIZIB-CM/info.zip OAIZIB-CM/template_atlas.zip
mv OAIZIB-CM/* .
unzip imagesTr.zip
rm -rf imagesTr.zip
unzip imagesTs.zip
rm -rf imagesTs.zip
unzip labelsTr.zip
rm -rf labelsTr.zip
unzip labelsTs.zip
rm -rf labelsTs.zip

# preprocessing

nnUNetv2_plan_and_preprocess -d 1


