[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/soichih/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.117-blue.svg)](https://doi.org/10.25663/brainlife.app.117)

# app-noddi-amico

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Fits the NODDI model to single-shell DWI with the AMICO toolbox; only the orientation dispersion index (ODI) is reliable from single-shell data.**

Same pipeline as the multi-shell NODDI AMICO App (FSL bet mask unless provided, b-value rounding, AMICO NODDI fit with the chosen parallel diffusivity) applied to single-shell DWI. Use it when only one diffusion shell is available and you need orientation dispersion; NDI and ISOVF from single-shell data should not be trusted.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.366](https://doi.org/10.25663/brainlife.app.366)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` (single_shell) | yes | this should be single shell dwi data |
| `1` | `neuro/mask` | no | mask needs to be made from DWI image |

| Output | Datatype | Description |
|---|---|---|
| `noddi` | `neuro/noddi` | only the orientation dispersion (OD) measure should be trusted |
| `mask` | `neuro/mask` | Brain mask in DWI space used for the fit (the provided mask, or one generated with FSL bet). |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `dPar` | number | `0.0017` | Parallel intrinsic diffusivity used by the NODDI model. Use 0.0017 for white matter and 0.0011 for cortical mapping. |
| `advancedMask` | boolean | `false` | Sometimes mask generation does not remove all of the non-brain material. If True, this will make sure the non-brain material is fully removed. Only check if inputting a mask that contains non-brain material |
| `debias` | boolean | `false` | Select this if you want to perform signal debiasing before NODDI fit |

Runtime: container `brainlife/fsl:5.0.9`; 8 CPUs; 8 h walltime.

Please cite:
- Daducci A, Canales-Rodriguez EJ, Zhang H, Dyrby TB, Alexander DC, Thiran JP. Accelerated Microstructure Imaging via Convex Optimization (AMICO) from diffusion MRI data. NeuroImage 105:32-44 (2015). [doi:10.1016/j.neuroimage.2014.10.026](https://doi.org/10.1016/j.neuroimage.2014.10.026)
- Zhang H, Schneider T, Wheeler-Kingshott CA, Alexander DC. NODDI: practical in vivo neurite orientation dispersion and density imaging of the human brain. NeuroImage 61(4):1000-1016 (2012). [doi:10.1016/j.neuroimage.2012.03.072](https://doi.org/10.1016/j.neuroimage.2012.03.072)

<!-- brainlife-app:end -->

This app will fit the Neurite Orientation Dispersion and Density Imaging (NODDI; Zhang et al, 2012) model to multi-shell, normalized DWI data using the Accelerated Microstructure Imaging via Convex Optimization (AMICO; Daducci et al, 2015) toolbox. First, a brainmask of the aligned dwi will be made using FSL's bet function by running the brainmask script. Finally, the NODDI model will be fit using AMICO toolbox by running the NODDI script. 

### Authors
- Brad Caron (bacaron@iu.edu)

### Contributors
- Soichi Hayashi (hayashi@iu.edu)
- Franco Pestilli ([@francopestilli](https://github.com/francopestilli))

### Funding
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.35](https://doi.org/10.25663/bl.app.35) via the "Execute" tab.

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


