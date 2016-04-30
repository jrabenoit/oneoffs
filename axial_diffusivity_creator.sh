#!/bin/bash

for D in */; do
	(cd $D && 
	L2=*_L2.nii.gz
	L3=*_L3.nii.gz
	RD=$(basename $D)"_RD"
	fsl5.0-fslmaths $L2 -add $L3 -div 2 $RD);
done
