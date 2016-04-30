#!/bin/bash

# Sets sdir as the subject's directory name	
	sdir="$(basename ${PWD})"
# Check the directory name when it's printed for you
	echo $sdir
# Renaming function- changes the preprocessed data, bvals, bvecs, and brain mask names for bedpostx
	mv 20*.bval bvals
	mv 20*.bvec bvecs
# Runs bedpostx in a shell- goes up one level, then runs bedpostx on the subject directory	
	(cd .. && /usr/bin/fsl5.0-bedpostx $sdir)
# Tells you when the subject is done
printf "\n\n -----DONE----- \n\n"

