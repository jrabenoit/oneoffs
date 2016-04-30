#!/bin/bash

#Righty-o so here's how this works. Take your V1 files from dtifit and put them in a folder named V1. Copy your *_FA_FA_to_target.mat files from the TBSS FA folder into a folder named warp_inputs. Copy your target.nii.gz file from the FA folder to the general TBSS folder. Change the file paths for im#_files as necessary. Make sure you turn this V1_warper.sh file into a shell program using chmod +x ~/V1_warper.sh (provided it's sitting in your home directory, which it should be). Make another directory named warp_outputs, cd to that folder, and run ~/V1_warper.sh.

im1_files=(/home/james/Desktop/Depression/04_Mar03_V1_reg_to_mean_FA/V1/*.nii.gz)
im2_files=(/home/james/Desktop/Depression/04_Mar03_V1_reg_to_mean_FA/warp_inputs/*.mat)

im3_files=(/home/james/Desktop/Depression/04_Mar03_V1_reg_to_mean_FA/target.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}" 
	fsl5.0-vecreg -i "${im1_files[i]}" -o "$(basename ${im1_files[i]})_warped.nii.gz" -r "${im3_files}" -t "${im2_files[i]}";
done
