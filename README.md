[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/soichih/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.35-blue.svg)](https://doi.org/10.25663/bl.app.35)

# app-noddi-amico
This app will fit the Neurite Orientation Dispersion and Density Imaging (NODDI; Zhang et al, 2012) model to multi-shell, normalized DWI data using the Accelerated Microstructure Imaging via Convex Optimization (AMICO; Daducci et al, 2015) toolbox. First, the multi-shell data to the single-shell data will be registered with the dtiinit T1-aligned DWI image in order to assure that NODDI outputs are in the same space as the tensor outputs for later analyses using FSL's flirt by running the alignment script. Next, a brainmask of the aligned dwi will be made using FSL's bet function by running the brainmask script. Then, the bvecs will be rotated based on the transformation by using Vistasoft's dtiRawReorientBvecs function by running the rotateBvecs script. Finally, the NODDI model will be fit using AMICO toolbox by running the NODDI script. 

#### Authors
- Brad Caron (bacaron@iu.edu)
- Soichi Hayashi (hayashi@iu.edu)
- Franco Pestilli (franpest@indiana.edu)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.35](https://doi.org/10.25663/bl.app.35) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
        "dtiinit": "./input/dtiinit/",
        "dwi": "./input/dwi/dwi.nii.gz",
        "bvals": "./input/dwi/dwi.bvals",
        "bvecs": "./input/dwi/dwi.bvecs"
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download 5a14f50eeb00be0031340619 && mv 5a14f50eeb00be0031340619 input/dtiinit
bl dataset download 5a14a976eb00be0031340617 && mv 5a14a976eb00be0031340617 input/dwi

```


3. Launch the App by executing `main`

```bash
./main
```

## Output

The main output of this App are five NODDI output files: FIT_ICVF_NEW, FIT_OD_NEW, FIT_ISOVF_NEW, FIT_dir, and config.pickle. These can then be used in app-tractanalysisprofiles.


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


