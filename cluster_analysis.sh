#!/bin/bash

# fsl5.0-cluster -i tbss_tstat1.nii.gz -t 0.999

echo 0.90
fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.90 -o mask090
#echo 0.91
#fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.91 -o mask091
#echo 0.92
#fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.92 -o mask092
#echo 0.93
#fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.93 -o mask093
#echo 0.94
#fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.94 -o mask094
#echo 0.95
#fsl5.0-cluster -i tbss_tfce_corrp_tstat2.nii.gz -t 0.95 -o mask095

#echo 0.90
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.90 -o mask090e
#echo 0.91
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.91 -o mask091e
#echo 0.92
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.92 -o mask092e
#echo 0.93
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.93 -o mask093e
#echo 0.94
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.94 -o mask094e
#echo 0.95
#fsl5.0-cluster -i tbss_clustere_corrp_tstat2.nii.gz -t 0.95 -o mask095e
