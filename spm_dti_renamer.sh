#!/bin/bash

for D in *;
do (cd $D && mv *FA.nii.gz FA.nii.gz);
done

for D in *;
do (cd $D && mv average5volt2_corr.nii.gz b0.nii.gz);
done

for D in *;
do (cd $D && mv *AXT*.nii.gz V0001.nii.gz && gunzip V0001.nii.gz);
done
