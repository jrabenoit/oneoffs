#!/bin/bash

# Author: James Benoit
# Project: Raj Ramasubbu's Depression DTI data
# Syntax in accordance with http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FDT/UserGuide#Processing_pipeline
# Last Modified Mar 03, 2015

# ECC ON CLEANED VOLUMES
for D in *;
do (cd $D ; fsl5.0-eddy_correct DTI_cleaned.nii.gz ecc 0); done

# FSLROI FOR BRAIN MASK AND BET2 TO CREATE BINARY MASK
for D in *; 
do (cd $D ; fsl5.0-bet2 ecc bet_brain -m -f 0.3); done

# DTI TENSOR FITTING
for D in *;
do (cd $D && fsl5.0-dtifit -k ecc.nii.gz -o ${PWD##*/} -m bet_brain_mask -r bvecs -b bvals); done
