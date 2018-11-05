#!/bin/bash

echo "Setting file paths"
# Grab the config.json inputs
dwi=`jq -r '.dwi' config.json`;
bvals=`jq -r '.bvals' config.json`;
bvecs=`jq -r '.bvecs' config.json`;
doadvance=`jq -r '.advancedMask' config.json`;
otherMask=`jq -r '.mask' config.json`;
if [ $otherMask != "null" ]; then
	export otherMaskNifti=$otherMask
fi
noddiFile="NODDI";
mkdir $noddiFile;

echo "Files loaded"

# Create b0
select_dwi_vols \
	${dwi} \
	${bvals} \
	nodif.nii.gz \
	0;

# Brain extraction before alignment
bet nodif.nii.gz \
	nodif_brain \
	-f 0.4 \
	-g 0 \
	-m;

if [ $doadvance == True ]; then
	fslmaths $otherMask -mul nodif_brain_mask.nii.gz nodif_brain_mask.nii.gz
fi

echo "brainmask creation complete"

