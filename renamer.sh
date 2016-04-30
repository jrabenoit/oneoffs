#!/bin/bash

# Add the directory name as a prefix to all directories in the directory
#for D in *; do mv -v "$D" "$(basename ${PWD})_$D"; done 

# Add the directory name as a prefix to all files in the directory
# for D in * ; do cd $D ; for file in * ; do mv -v "$file" "$(basename ${PWD})_$file"; done ; cd .. ; done

# Move the files in all subdirectories into the parent
#for D in * ; do cd $D ; for file in * ; do mv -v "$file" .. ; done ; cd .. ; rm -rf $D; done

# Remove everything up to and including the first _ in a filename
# for file in * ; do mv -v "$file" "${file#*_}" ; done

# Renames the L1 portion of all filenames in a folder to FA, leaving the rest of the filename alone. To do the actual renaming, remove the n from the end of the line.
# rename 's/L1/FA/g' *.nii.gz -vn

# Moves files two levels up
#for D in *; do 
#(cd $D; cd Anat; cd resliced_dti; mv -v "DTI_allvols.nii.gz" ../..); 
#done

# Renames a particular file in each directory by adding directory name as a prefix

#for D in *; do 
#(cd $D ; mv -v DTI-4D.nii.gz "$(basename ${PWD})_DTI_allvols.nii.gz"); done

#for D in *; do 
#(cd $D ; mv -v *.nii.gz DTI_cleaned.nii.gz); done

#Quick way to do renaming from terminal, for all files in a folder
#rename s/"BIT_TO_RENAME"/"RENAME_AS_THIS"/g *

#Rename all files in one folder to mirror names of files in another folder.
im1_files=(/home/james/Desktop/Depression/07_Machine_Learning/01_FA_Maps/*.nii.gz)
im2_files=(/home/james/Desktop/Depression/07_Machine_Learning/03_FA_Skeletonized/*.nii.gz)

for ((i=0; i<${#im1_files[@]};i++)); do
	echo "${im1_files[i]}" 
    rename s/"$( basename ${im2_files[i]})"/"$(basename ${im1_files[i]})"/g *;
done

