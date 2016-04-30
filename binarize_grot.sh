#!/bin/bash

for f in *;
do (fsl5.0-fslmaths $f -bin $f);
done
