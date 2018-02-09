#!/bin/bash

noddiImages="FIT_ICVF_NEW.nii.gz FIT_ISOVF_NEW.nii.gz FIT_OD_NEW.nii.gz FIT_dir.nii.gz config.pickle";
noddiFile="NODDI";
num="1 2 3";
mkdir $noddiFile;


echo "Setting file paths"
# Grab the config.json inputs
dwi=`jq -r '.dwi' config.json`;
bvals=`jq -r '.bvals' config.json`;
bvecs=`./jq -r '.bvecs' config.json`;
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

for NUM in $num
	do
		sed -n "${NUM}p" ${bvecs} > row_${NUM}.txt
		fmt -1 row_${NUM}.txt > col_${NUM}.txt
		fmt -1 ${bvals} > col_bvals.txt
	done
pr -m -t col_1.txt col_2.txt col_3.txt col_bvals.txt > bvals.scheme
rm -rf *col* *row*
cp -v nodif_brain_mask.nii.gz ./NODDI/
cp -v bvals.scheme ./NODDI/
cp -v ${dwi} ./NODDI/dwi.nii.gz


echo "b0 brainmask creation complete"
