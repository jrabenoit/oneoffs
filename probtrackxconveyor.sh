#!/bin/bash

bpx_sample_files=(merged)
mask_files=(nodif_brain_mask.nii.gz)
seed_volume=(*-mask.nii.gz)

for D in *; do
	(cd $D && fsl5.0-probtrackx2 -s "$bpx_sample_files" -m "$mask_files" -x "$seed_volume");
done
