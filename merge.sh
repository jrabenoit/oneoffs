#!/bin/bash

for D in *; do
(cd $D ; allvols=vol*.nii.gz
fsl5.0-fslmerge -a "$(basename ${PWD})_revised" $allvols ;
rm -rf vol00*.nii.gz); done

