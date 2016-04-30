#!/bin/bash

# DICOM TO NIFTI CONVERTER
for D in *;
	do (cd $D && dcm2nii ${PWD});
done
