#!/bin/bash

# Runs AlphSim on the mask image, 10000 iterations, p<0.005

AlphaSim -mask vols_multiplied_mask_alphasim.nii -iter 10000 -pthr 0.005 -fwhm 4.4 -quiet -fast -approx

