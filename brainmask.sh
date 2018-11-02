#!/bin/bash

echo "Setting file paths"
# Grab the config.json inputs
dwi=`jq -r '.dwi' config.json`;
bvals=`jq -r '.bvals' config.json`;
bvecs=`jq -r '.bvecs' config.json`;
dtiinit=`jq -r '.dtiinit' config.json`;
dtiinitDwi=$dtiinit/dwi_aligned_trilin_noMEC.nii.gz;
dtiinitBvals=$dtiinit/dwi_aligned_trilin_noMEC.bvals;
echo "Files loaded"

# Create b0
select_dwi_vols \
	dwi.nii.gz \
	${bvals} \
	nodif.nii.gz \
	0;

# Brain extraction before alignment
bet nodif.nii.gz \
	mask \
	-f 0.4 \
	-g 0 \
	-m;

echo "brainmask creation complete"

