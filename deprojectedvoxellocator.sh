#!/bin/bash

subgrot=*_grot.nii.gz
for D in *;
do (fsl5.0-cluster -i $subgrot -t 0.5);
done
