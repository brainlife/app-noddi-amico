#!/usr/bin/env python
##  NODDI microstructural model (Zhang et al, 2012).  Uses AMICO toolbox (Daducci et al, 2015; https://github.com/daducci/AMICO)

import os
import sys
import json

#https://github.com/daducci/AMICO/issues/56
nb_threads = 3
os.environ["OMP_NUM_THREADS"] = str(nb_threads)
os.environ["MKL_NUM_THREADS"] = str(nb_threads)
print("using up to "+str(nb_threads)+" cores")

#I need to load amico after I set OIM_NUM_THREADS
import amico
#amico.core.setup()

with open('config.json') as config_json:
        config = json.load(config_json)
        dPar = float(config['dPar'])
        bvecs = config['bvecs']
        debias = config['debias']

ae = amico.Evaluation(os.getcwd(),"NODDI")

#https://github.com/daducci/AMICO/issues/56

if debias is True:
        ae.set_config('doDebiasSignal',True)
        ae.set_config('DWI-SNR',30.)

amico.util.fsl2scheme("./NODDI/dwi.bvals",bvecs)
ae.load_data(dwi_filename = "dwi.nii.gz", 
        scheme_filename = "dwi.scheme", 
        mask_filename = "nodif_brain_mask.nii.gz", 
        b0_thr = 0)


ae.set_model("NODDI") #this creates solver_params

ae.model.dPar = dPar
ae.generate_kernels( regenerate = True )

#https://github.com/daducci/AMICO/issues/67
ae.CONFIG['solver_params']['numThreads'] = nb_threads

ae.load_kernels()
ae.fit()
ae.save_results()
print("NODDI model generation complete")

