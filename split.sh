#!/bin/bash

for D in *; do 
(cd $D; fsl5.0-fslsplit *.nii.gz vol -t); done


