#!/bin/bash

#im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS/origdata/*_FA.nii.gz)
#im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS/stats/cluster_masks/*-clustermask.nii.gz)

#for ((i=0; i<${#im1_files[@]};i++)); do
#	echo "${im1_files[i]}"
#	echo "${im2_files[i]}" 
#	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-#clusteraverage".txt;
#done

im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/origdataFA/*_FA.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/stats/tmap_cluster_masks/*-clustermask.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files[i]}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-clusteraverageFA".txt;
done

im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/origdataL1/*_L1.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/stats/tmap_cluster_masks/*-clustermask.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files[i]}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-clusteraverageL1".txt;
done

im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/origdataL2/*_L2.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/stats/tmap_cluster_masks/*-clustermask.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files[i]}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-clusteraverageL2".txt;
done

im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/origdataL3/*_L3.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/stats/tmap_cluster_masks/*-clustermask.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files[i]}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-clusteraverageL3".txt;
done

im1_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/origdataMD/*_MD.nii.gz)
im2_files=(/home/james/Desktop/May_14_New_Analysis/TBSS_peak_voxel/stats/tmap_cluster_masks/*-clustermask.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}"
	echo "${im2_files[i]}" 
	fsl5.0-fslmeants -i "${im1_files[i]}" --label="${im2_files[i]}" -o "${im2_files[i]%%.*}-clusteraverageMD".txt;
done
