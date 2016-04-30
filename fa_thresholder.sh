#!/bin/bash

#for f in *; do
#	fsl5.0-fslmaths $f -thr 0.2 $f;
#done

#for f in *; do
#	fsl5.0-fslmaths $f -bin $f;
#done

im1_files=(/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/Thresholded_02_individually_group_difference_voxel_based/Conjunction_FA/*.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/Thresholded_02_individually_group_difference_voxel_based/Conjunction_FA/vol0000.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}" 
	fsl5.0-fslmaths "vols_multiplied.nii.gz" -mul "${im1_files[i]}" "vols_multiplied.nii.gz";
done

