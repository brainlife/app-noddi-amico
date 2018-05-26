#!/usr/bin/env python
import os,sys

def reslice_fxn():
	import nibabel as nib
	import dipy
	import json
	from dipy.align.reslice import reslice
	from dipy.data import get_data

	with open('config.json') as config_json:
        	config = json.load(config_json)

	if not config['resolution']:
		fimg_orig = nib.load(config['dwi'])
		new_zooms = fimg_orig.header.get_zooms()[:3]
	else:
		new_zooms = int(config['resolution'])
	
	fimg = 'dwi.nii.gz'
	img = nib.load(fimg)
	data = img.get_data()
	affine = img.affine
	zooms = img.header.get_zooms()[:3]
	data2, affine2 = reslice(data, affine, zooms, new_zooms)
	img2 = nib.Nifti1Image(data2, affine2)
	nib.save(img2, 'dwi.nii.gz')
	print("Reslice complete")

reslice_fxn()
