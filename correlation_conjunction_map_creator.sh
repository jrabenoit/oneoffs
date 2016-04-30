#!/bin/bash

# Commands for making a positive conjunction map

fsl5.0-fslmaths tbss_AD_tfce_corrp_tstat2.nii.gz -thr 0.9 tbss_AD_tfce_corrp_tstat2_thr.nii.gz

fsl5.0-fslmaths tbss_tfce_corrp_tstat2.nii.gz -thr 0.9 tbss_tfce_corrp_tstat2_thr.nii.gz

fsl5.0-fslmaths tbss_AD_tfce_corrp_tstat2.nii.gz -mas tbss_tfce_corrp_tstat2_thr.nii.gz tbss_tfce_corrp_tstat2_positive_conjunction_map

# Commands for making a negative conjunction map

fsl5.0-fslmaths tbss_tfce_corrp_tstat2_thr -sub tbss_AD_tfce_corrp_tstat2_thr tbss_tfce_corrp_tstat2_FA_minus_AD

fsl5.0-fslmaths tbss_tfce_corrp_tstat2_FA_minus_AD -thr 0 tbss_tfce_corrp_tstat2_FA_not_AD_thr

fsl5.0-fslmaths tbss_AD_tfce_corrp_tstat2_thr -sub tbss_tfce_corrp_tstat2_thr tbss_tfce_corrp_tstat2_AD_minus_FA

fsl5.0-fslmaths tbss_tfce_corrp_tstat2_AD_minus_FA -thr 0 tbss_tfce_corrp_tstat2_AD_not_FA_thr


