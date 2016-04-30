#!/bin/bash

# Author: James Benoit
# Syntax in accordance with http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FDT/UserGuide#Processing_pipeline
# Last Modified Oct 26, 2013
# Last Reviewed Mar 4, 2014

# 1. DICOM TO NIFTI CONVERTER
#for D in *;
#do (cd $D && 
#	dcm2nii ${PWD}
#); done

# SPLIT UNCORRECTED 4D VOLUME INTO 32 3D VOLUMES
for D in *;
do (cd $D && 
	fsl5.0-fslsplit *.nii.gz vol -t
); done

# CREATE AN AVERAGE IMAGE OF THE FIRST 3 T2 VOLUMES, RUNNING ECC ON THE 3 VOLUME T2 IMAGE BEFORE AVERAGING
for D in *;
do (cd $D && 
	fsl5.0-fslmerge -a 3volforecc.nii.gz vol0000.nii.gz vol0001.nii.gz vol0002.nii.gz
	fsl5.0-eddy_correct 3volforecc.nii.gz 3volforecc_corr 0
	fsl5.0-fslsplit 3volforecc_corr.nii.gz 3volecc -t	
	
	fsl5.0-fslmaths 3volecc0000.nii.gz -add 3volecc0001.nii.gz -add 3volecc0002.nii.gz 3voloutput.nii.gz
	fsl5.0-fslmaths 3voloutput.nii.gz -div 3 average3volt2_corr.nii.gz

	rm -rf 3volecc000*.nii.gz
	rm -rf 3volforecc.nii.gz
	rm -rf 3volforecc_corr.nii.gz
	rm -rf 3voloutput.nii.gz	
); done

# ECC FOR 3 T2'S USING AVERAGE T2 AS REFERENCE VOL AND REMOVAL OF THE REFERENCE FROM THE CONCATENATED ECC'D 5 VOL T2
for D in *;
do (cd $D && 
	fsl5.0-fslmerge -a t2avg_and_t2vols average3volt2_corr.nii.gz vol0000.nii.gz vol0001.nii.gz vol0002.nii.gz
	fsl5.0-eddy_correct t2avg_and_t2vols.nii.gz t2data 0
	rm -rf t2avg_and_t2vols.nii.gz
	fsl5.0-fslsplit t2data.nii.gz eccvol -t 
	rm -rf t2data.nii.gz
	rm -rf eccvol0000.nii.gz 
	eccvols=eccvol*.nii.gz
	fsl5.0-fslmerge -a ecct2vols $eccvols
	rm -rf eccvol*.nii.gz
	rm -rf vol0000.nii.gz rm -rf vol0001.nii.gz rm -rf vol0002.nii.gz
); done

# PREPARE A 31-VOLUME 4D IMAGE TO GO INTO ECC
for D in *;
do (cd $D && 
	dwivols=vol00*.nii.gz
	avgvol=average3volt2_corr.nii.gz
	allvols="$avgvol $dwivols"
	fsl5.0-fslmerge -a prepared $allvols
); done

# ECC ON 31-VOLUME SET AND REMOVAL OF AVERAGED T2 FROM SET
for D in *;
do (cd $D && 
	fsl5.0-eddy_correct prepared.nii.gz dwidata 0
	rm -rf prepared.nii.gz
	fsl5.0-fslsplit dwidata.nii.gz eccdwivol -t
	rm -rf eccdwivol0000.nii.gz
	eccdwivols=eccdwivol00*.nii.gz
	fsl5.0-fslmerge -a dwidata $eccdwivols
	rm -rf eccdwivol00*.nii.gz
); done

# READY A 35-VOLUME 4D ECC IMAGE TO GO INTO DTIFIT.
# *** NOTE THAT WE HAVE RUN ECC INDEPENDENTLY ON THE 5 T2 VOLUMES ***
for D in *;
do (cd $D && 
	ecct2vols=ecct2vols.nii.gz 
	dwivols=dwidata.nii.gz 
	allvols="$ecct2vols $dwivols" 
	fsl5.0-fslmerge -a data $allvols  
	rm -rf average3volt2_corr.nii.gz 
	rm -rf dwidata.nii.gz 
	rm -rf ecct2vols.nii.gz
	rm -rf vol00*.nii.gz
	rm -rf *.ecclog
); done

# FSLROI FOR BRAIN MASK AND BET2 TO CREATE BINARY MASK
for D in *;
do (cd $D &&	
	fsl5.0-fslroi data fslroi_brain 0 35
	fsl5.0-bet2 fslroi_brain nodif_brain -m -f 0.3
); done

# DTI TENSOR FITTING
for D in *;
do (cd $D &&
	bvectors=*.bvec
	bvalues=*.bval
	fsl5.0-dtifit -k data -o ${PWD##*/} -m nodif_brain_mask -r $bvectors -b $bvalues --wls
); done
