#!/bin/bash


# SPLIT UNCORRECTED 4D VOLUME INTO 35 3D VOLUMES
for D in *;
do (cd $D && 
	fsl5.0-fslsplit *.nii.gz vol -t
); done

# CREATE AN AVERAGE IMAGE OF THE FIRST 5 T2 VOLUMES, RUNNING ECC ON THE 5 VOLUME T2 IMAGE BEFORE AVERAGING
for D in *;
do (cd $D && 
	fsl5.0-fslmerge -a 5volforecc.nii.gz vol0000.nii.gz vol0001.nii.gz vol0002.nii.gz vol0003.nii.gz vol0004.nii.gz
	fsl5.0-eddy_correct 5volforecc.nii.gz 5volforecc_corr 0
	fsl5.0-fslsplit 5volforecc_corr.nii.gz 5volecc -t	
	
	fsl5.0-fslmaths 5volecc0000.nii.gz -add 5volecc0001.nii.gz -add 5volecc0002.nii.gz -add 5volecc0003.nii.gz -add 5volecc0004.nii.gz 5voloutput.nii.gz
	fsl5.0-fslmaths 5voloutput.nii.gz -div 5 average5volt2_corr.nii.gz


	rm -rf 5volecc000*.nii.gz
	rm -rf 5volforecc.nii.gz
	rm -rf 5volforecc_corr.nii.gz
	rm -rf 5voloutput.nii.gz	
	rm -rf vol0001.nii.gz rm -rf vol0002.nii.gz rm -rf vol0003.nii.gz rm -rf vol0004.nii.gz
); done



