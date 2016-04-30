#!/bin/bash

im1_files=(z)
im2_files=(/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_whole_FA_map_all_subjects_correlation_voxel_by_voxel_rerun/stats/pthr_clusthr_tstat1.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files}" -o "${im1_files[i]%%.*}-subjectaverageFA_tstat1".txt;
done


