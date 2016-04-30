#!/bin/bash


#fsl5.0-fslmaths tbss_tfce_corrp_tstat2-mask -index grot

#fsl5.0-tbss_deproject tbss_tfce_corrp_tstat2-mask 2

echo deprojecting 0.90
fsl5.0-tbss_deproject mask090.nii.gz 2 -n
#echo deprojecting 0.91
#fsl5.0-tbss_deproject mask091.nii.gz 2
#echo deprojecting 0.92
#fsl5.0-tbss_deproject mask092.nii.gz 2
#echo deprojecting 0.93
#fsl5.0-tbss_deproject mask093.nii.gz 2
#echo deprojecting 0.94
#fsl5.0-tbss_deproject mask094.nii.gz 2
#echo deprojecting 0.95
#fsl5.0-tbss_deproject mask095.nii.gz 2

