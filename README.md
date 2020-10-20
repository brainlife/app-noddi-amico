[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/soichih/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.365-blue.svg)](https://doi.org/10.25663/brainlife.app.365)

# app-noddi-amico
This app will fit the Neurite Orientation Dispersion and Density Imaging (NODDI; Zhang et al, 2012) model to multi-shell, normalized DWI data using the Accelerated Microstructure Imaging via Convex Optimization (AMICO; Daducci et al, 2015) toolbox. First, a brainmask of the aligned dwi will be made using FSL's bet function by running the brainmask script. Finally, the NODDI model will be fit using AMICO toolbox by running the NODDI script. 

### Authors
- Brad Caron (bacaron@iu.edu)

### Contributors
- Soichi Hayashi (hayashi@iu.edu)
- Franco Pestilli (franpest@indiana.edu)

### Funding
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

### Citations 

Please cite the following articles when publishing papers that used data, code or other resources created by the brainlife.io community. 

1. Daducci A, Canales-Rodríguez EJ, Zhang H, Dyrby TB, Alexander DC, Thiran JP. Accelerated Microstructure Imaging via Convex Optimization (AMICO) from diffusion MRI data. Neuroimage. 2015 Jan 15;105:32-44. doi: 10.1016/j.neuroimage.2014.10.026. Epub 2014 Oct 22. PMID: 25462697.

1. Zhang H, Schneider T, Wheeler-Kingshott CA, Alexander DC. NODDI: practical in vivo neurite orientation dispersion and density imaging of the human brain. Neuroimage. 2012 Jul 16;61(4):1000-16. doi: 10.1016/j.neuroimage.2012.03.072. Epub 2012 Mar 30. PMID: 22484410.


## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.365](https://doi.org/10.25663/brainlife.app.365) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
        "dwi": "./input/dwi/dwi.nii.gz",
        "bvals": "./input/dwi/dwi.bvals",
        "bvecs": "./input/dwi/dwi.bvecs",
        "dPar": 0.017,
        "advancedMask": false,
        "debias":       false
        "mask": "./input/brainmask/mask.nii.gz"
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download 5b96bcd9059cf900271924f7 && mv 5b96bcd9059cf900271924f7 input/dwi

```


3. Launch the App by executing `main`

```bash
./main
```

## Output

The main output of this App are four NODDI output files: neurite density index (ndi), orientation dispersion index (odi), isotropic volume fraction (isovf), and the directions (dir). These can then be used in app-tractanalysisprofiles and other apps which take in a NODDI input.


#### Product.json
The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing. 

### Dependencies

This App requires the following libraries when run locally.

  - singularity: https://singularity.lbl.gov/
  - VISTASOFT: https://github.com/vistalab/vistasoft/
  - SPM 8: https://www.fil.ion.ucl.ac.uk/spm/software/spm8/
  - Amico: https://hub.docker.com/r/brainlife/amico/tags/1.0
  - FSL: https://hub.docker.com/r/brainlife/fsl/tags/5.0.9
  - jsonlab: https://github.com/fangq/jsonlab.git


