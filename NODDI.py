#!/usr/bin/env python
##  NODDI microstructural model (Zhang et al, 2012).  Uses AMICO toolbox (Daducci et al, 2015; https://github.com/daducci/AMICO)

import os
import sys

def NODDI():
	import json
	import amico
	import amico
	import json
	
	with open('config.json') as config_json:
		config = json.load(config_json)
		dPar = float(config['dPar'])
                bvecs = config['bvecs']
		debias = config['debias']

	cwd = os.getcwd()
	amico.core.setup()
	ae = amico.Evaluation(cwd,"NODDI")
	if debias is True:
		ae.set_config('doDebiasSignal',True)
        	ae.set_config('DWI-SNR',30.)
        
	amico.util.fsl2scheme("./NODDI/dwi.bvals",bvecs)
        ae.load_data(dwi_filename = "dwi.nii.gz", scheme_filename = "dwi.scheme", mask_filename = "nodif_brain_mask.nii.gz", b0_thr = 0)
	ae.set_model("NODDI")
	ae.model.dPar = dPar
	ae.generate_kernels( regenerate = True )
	ae.load_kernels()
	ae.fit()
	ae.save_results()
	print("NODDI model generation complete")

NODDI()
