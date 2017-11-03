#!/usr/bin/env python
##  NODDI microstructural model (Zhang et al, 2012).  Uses AMICO toolbox (Daducci et al, 2015; https://github.com/daducci/AMICO)

import os
import sys

def NODDI():
	import amico
	cwd = os.getcwd()
	amico.core.setup()
	ae = amico.Evaluation(cwd,"NODDI")
	ae.load_data(dwi_filename = "dwi.nii.gz", scheme_filename = "bvals.scheme", mask_filename = "nodif_brain_mask.nii.gz", b0_thr = 1)
	ae.set_model("NODDI")
	ae.generate_kernels( regenerate = True )
	ae.load_kernels()
	ae.fit()
	ae.save_results()
	print("NODDI model generation complete")

NODDI()
