#!/bin/bash

#Standard randomise setup for TBSS data
#fsl5.0-randomise -i all_FA_skeletonised -o tbss -m mean_FA_skeleton_mask -d design_age.mat -t design_age.con -v 4.4 --T2

#First run of randomise on Raj's data, without variance smoothing.
fsl5.0-randomise -i all_FA_skeletonised -o tbss -m mean_FA_skeleton_mask -d design.mat -t design.con --T2


#Making mask of mean FA to prevent randomise from comparing most voxels below 0.2
#Set this to 500 permutations, -n 500, if you want a test run
#fsl5.0-fslmaths mean_FA -thr 0.2 -bin mean_FA_thr_mask
#fsl5.0-randomise -i all_FA -o tbss -m mean_FA_thr_mask.nii.gz -d design_age.mat -t design_age.con -v 2 -x 

#Randomise using the all subjects conjunction mask
#fsl5.0-randomise -i HC_from_all_RD -o HC_RD -m vols_multiplied.nii.gz -d design_age.mat -t design_age.con -v 2 -x
