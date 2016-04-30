#!/bin/bash

#This program looks for differences in white matter integrity in controls than clinical subjects. tstat2 is where control>clinical, which we expect to see in AD (axial diffusivity) and FA. tstat1 is where clinical>control, which is expected in MD and RD.

#File names
#AD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_AD_wholebrain_voxel/stats/pthr_clusthr_tstat2.nii.gz'
#MD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_MD_wholebrain_voxel/stats/pthr_clusthr_tstat1.nii.gz'
#RD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_RD_wholebrain_voxel/stats/pthr_clusthr_tstat1.nii.gz'
#FA='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_whole_FA_map_group_difference_voxel_by_voxel_rerun/stats/pthr_clusthr_tstat2.nii.gz'

#Four map conjunction
#fourmapconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/4_map_conjunction.nii.gz'

#Three map conjunctions
#ADMDRDconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_MD_RD_map_conjunction.nii.gz'
#ADRDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_RD_FA_map_conjunction.nii.gz'
#ADMDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_MD_FA_map_conjunction.nii.gz'
#MDRDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/MD_RD_FA_map_conjunction.nii.gz'

#Two map conjunctions
#ADFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_FA_map_conjunction.nii.gz'
#MDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/MD_FA_map_conjunction.nii.gz'
#RDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/RD_FA_map_conjunction.nii.gz'

#FSLmaths conjunction formulas
#fsl5.0-fslmaths $AD -mul $MD -mul $RD -mul $FA $fourmapconj

#fsl5.0-fslmaths $AD -mul $MD -mul $RD $ADMDRDconj

#fsl5.0-fslmaths $AD -mul $RD -mul $FA $ADRDFAconj

#fsl5.0-fslmaths $AD -mul $MD -mul $FA $ADMDFAconj

#fsl5.0-fslmaths $MD -mul $RD -mul $FA $MDRDFAconj

#fsl5.0-fslmaths $AD -mul $FA $ADFAconj

#fsl5.0-fslmaths $MD -mul $FA $MDFAconj

#fsl5.0-fslmaths $RD -mul $FA $RDFAconj


#This is an expansion of the original program to look at conjunctions, but flipped in the other direction 

#File names
AD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_AD_wholebrain_voxel/stats/pthr_clusthr_tstat1.nii.gz'
MD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_MD_wholebrain_voxel/stats/pthr_clusthr_tstat1.nii.gz'
RD='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_RD_wholebrain_voxel/stats/pthr_clusthr_tstat1.nii.gz'
FA='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/TBSS_whole_FA_map_group_difference_voxel_by_voxel_rerun/stats/pthr_clusthr_tstat1.nii.gz'

#Four map conjunction
#fourmapconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/4_map_conjunction.nii.gz'

#Three map conjunctions
#ADMDRDconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_MD_RD_map_conjunction.nii.gz'
#ADRDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_RD_FA_map_conjunction.nii.gz'
#ADMDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_MD_FA_map_conjunction.nii.gz'
#MDRDFAconj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/MD_RD_FA_map_conjunction.nii.gz'

#Two map conjunctions
#AD_tstat1_FA_tstat2_conj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/AD_tstat1_FA_tstat2_conjunction.nii.gz'
#MD_tstat1_FA_tstat1_conj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/MD_tstat1_FA_tstat1_conjunction.nii.gz'
#RD_tstat1_FA_tstat1_conj='/home/james/Desktop/May_14_New_Analysis/Voxel_based_analyses/4_map_conjunction_analysis/RD_tstat1_FA_tstat1_conjunction.nii.gz'

#FSLmaths conjunction formulas

#fsl5.0-fslmaths $AD -mul $MD -mul $RD -mul $FA $fourmapconj


#fsl5.0-fslmaths $AD -mul $MD -mul $RD $ADMDRDconj

#fsl5.0-fslmaths $AD -mul $RD -mul $FA $ADRDFAconj

#fsl5.0-fslmaths $AD -mul $MD -mul $FA $ADMDFAconj

#fsl5.0-fslmaths $MD -mul $RD -mul $FA $MDRDFAconj


#fsl5.0-fslmaths $AD -mul $FA $AD_tstat1_FA_tstat2_conj

#fsl5.0-fslmaths $MD -mul $FA $MD_tstat1_FA_tstat1_conj

fsl5.0-fslmaths $RD -mul $FA $RD_tstat1_FA_tstat1_conj

