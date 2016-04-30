#!/bin/bash

for D in */;
	do (cd $D && 
newname=$(basename $D)
cp b0.nii.gz $newname"_b0".nii.gz 
echo ${D} "Done"
);done

for D in */;
	do (cd $D && 
newname=$(basename $D)
cp FA.nii.gz $newname"_FA".nii.gz
echo ${D} "Done"
);done
