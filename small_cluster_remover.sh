#!/bin/bash

fsl5.0-cluster -i tbss_vox_p_tstat1.nii.gz -t 0.995 --osize=thr_tstat1 
fsl5.0-cluster -i thr_tstat1.nii.gz -t 49 -o pthr_clusthr_tstat1 

fsl5.0-cluster -i tbss_vox_p_tstat2.nii.gz -t 0.995 --osize=thr_tstat2 
fsl5.0-cluster -i thr_tstat2.nii.gz -t 49 -o pthr_clusthr_tstat2 

