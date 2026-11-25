<h1 align="center">NODDI with AMICO</h1>

<p align="center">
  Neurite density, orientation dispersion and isotropic volume fraction maps from diffusion MRI, fitted with the NODDI model using the AMICO toolbox.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.229"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.229-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> **This branch, `1.2`, runs 2 brainlife.io Apps** that share the same code:
>
> - NODDI Amico (single shell) - Deprecated ([doi:10.25663/brainlife.app.229](https://doi.org/10.25663/brainlife.app.229)) (deprecated)
> - Noddi Amico - Deprecated ([doi:10.25663/brainlife.app.117](https://doi.org/10.25663/brainlife.app.117)) (deprecated)
>
> The other Apps in this repository are listed under **Versions on brainlife.io** below.

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

### NODDI Amico (single shell) - Deprecated

> **This fits the NODDI model on single shell data. The only value that should be trusted is orientation dispersion (OD), as this measure can be fit accurately with single shell data**

| | |
|---|---|
| **Inputs** | `neuro/dwi` · `neuro/mask` (optional) |
| **Outputs** | `neuro/noddi-deprecated` · `neuro/mask` |
| **Container** | `brainlife/fsl:5.0.9` |
| **Resources** | 8 CPUs · 28 GB memory · 6 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.229](https://doi.org/10.25663/brainlife.app.229) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` (single_shell) | yes | this should be single shell dwi data |
| `1` | `neuro/mask` | no | mask needs to be made from DWI image |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `noddi` | `neuro/noddi-deprecated` | only the orientation dispersion (OD) measure should be trusted |
| `1` | `neuro/mask` |  |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `dPar` | number | `0.0017` |  |
| `advancedMask` | boolean | `false` | Sometimes mask generation does not remove all of the non-brain material. If True, this will make sure the non-brain material is fully removed. Only check if inputting a mask that contains non-brain material |
| `debias` | boolean | `false` | Select this if you want to perform signal debiasing before NODDI fit |

</details>

### Noddi Amico - Deprecated

> **This app will fit the Neurite Orientation Dispersion and Density Imaging (NODDI; Zhang et al, 2012) model to multi-shell, normalized DWI data using the Accelerated Microstructure Imaging via Convex Optimization (AMICO; Daducci et al, 2015) toolbox.**

This app will fit the Neurite Orientation Dispersion and Density Imaging (NODDI; Zhang et al, 2012) model to multi-shell, normalized DWI data using the Accelerated Microstructure Imaging via Convex Optimization (AMICO; Daducci et al, 2015) toolbox. Requires normalized, multi-shell DWI data (including bvals and bvecs) and an optional brainmask of the DWI. Will output the four NODDI output files: neurite density index (ndi), orientation dispersion index (odi), isotropic volume fraction (isovf), and the directions (dirs).

| | |
|---|---|
| **Inputs** | `neuro/dwi` · `neuro/mask` (optional) |
| **Outputs** | `neuro/noddi-deprecated` · `neuro/mask` |
| **Container** | `brainlife/fsl:5.0.9` |
| **Resources** | 8 CPUs · 28 GB memory · 6 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.117](https://doi.org/10.25663/brainlife.app.117) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` (!single_shell, !dtiinit) | yes | The path to the DWI datatype |
| `1` | `neuro/mask` | no | mask needs to be made from DWI image |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `noddi` | `neuro/noddi-deprecated` | The NODDI (deprecated) measures fit using AMICO |
| `1` | `neuro/mask` | The brainmask of the DWI |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `dPar` | number | `0.0017` | The parallel diffusivity parameter. For white matter analyses, use 0.0017. For cortical mapping, use 0.0011 |
| `advancedMask` | boolean | `false` | Sometimes mask generation does not remove all of the non-brain material. If True, this will make sure the non-brain material is fully removed. Only check if inputting a mask that contains non-brain material |
| `debias` | boolean | `false` | Select this if you want to perform signal debiasing before NODDI fit |

</details>

<!-- brainlife-app:end -->

## Versions on brainlife.io

Each version is a separate App on brainlife.io, built from its own branch of this repository. The two current Apps run the same pipeline; pick the one that matches your data.

| App | Input | Branch | Run it | Status |
|---|---|---|---|---|
| NODDI Amico (single shell) | single-shell DWI | [`1.3`](https://github.com/brainlife/app-noddi-amico/tree/1.3) | [doi:10.25663/brainlife.app.366](https://doi.org/10.25663/brainlife.app.366) | current |
| Noddi Amico | multi-shell DWI | [`1.3`](https://github.com/brainlife/app-noddi-amico/tree/1.3) | [doi:10.25663/brainlife.app.365](https://doi.org/10.25663/brainlife.app.365) | current |
| Fit NODDI model using AMICO (dtiinit) | dtiInit output | [`dtiinit-v1.0`](https://github.com/brainlife/app-noddi-amico/tree/dtiinit-v1.0) | [doi:10.25663/brainlife.app.343](https://doi.org/10.25663/brainlife.app.343) | deprecated |
| **NODDI Amico (single shell) - Deprecated** (this branch) | single-shell DWI | [`1.2`](https://github.com/brainlife/app-noddi-amico/tree/1.2) | [doi:10.25663/brainlife.app.229](https://doi.org/10.25663/brainlife.app.229) | deprecated |
| **Noddi Amico - Deprecated** (this branch) | multi-shell DWI | [`1.2`](https://github.com/brainlife/app-noddi-amico/tree/1.2) | [doi:10.25663/brainlife.app.117](https://doi.org/10.25663/brainlife.app.117) | deprecated |
| Fit NODDI model using AMICO (dtiinit) - DEPRECATED | multi-shell DWI and dtiInit output | [`original_code`](https://github.com/brainlife/app-noddi-amico/tree/original_code) | [doi:10.25663/bl.app.35](https://doi.org/10.25663/bl.app.35) | deprecated |

NODDI needs multi-shell data to estimate neurite density and isotropic volume fraction. With single-shell data only the orientation dispersion index (ODI) can be fitted reliably; do not trust NDI and ISOVF from the single-shell App.

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.366](https://doi.org/10.25663/brainlife.app.366) for single-shell data or [doi.org/10.25663/brainlife.app.365](https://doi.org/10.25663/brainlife.app.365) for multi-shell data. Choose a preprocessed DWI dataset (and, optionally, a brain mask in DWI space), set the parallel diffusivity `dPar` and press **Execute**. Use `dPar` 0.0017 for white matter analyses and 0.0011 for cortical mapping. The NODDI maps (`neuro/noddi`) and the brain mask used for the fit (`neuro/mask`) are archived to your project and can feed tract-profile and ROI Apps that take a NODDI input.

The App builds a brain mask from the b=0 volumes with FSL `bet` (unless you provide one), rounds the b-values, fits NODDI with AMICO (optionally debiasing the signal first), and then sets NIfTI header fields that AMICO leaves out.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). FSL, AMICO, Python and the MATLAB runtime come from the containers that `main` pulls.

1. Clone this repository and check out the branch used on brainlife.io: `git checkout 1.3`.
2. Create `config.json` with the paths to your inputs and the options you want (`mask` is optional; remove it to let the App build one):

   ```json
   {
       "dwi": "./input/dwi/dwi.nii.gz",
       "bvals": "./input/dwi/dwi.bvals",
       "bvecs": "./input/dwi/dwi.bvecs",
       "mask": "./input/mask/mask.nii.gz",
       "dPar": 0.0017,
       "advancedMask": false,
       "debias": false
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

### Sample data

Download a sample DWI dataset from brainlife.io with the [brainlife CLI](https://github.com/brainlife/cli):

```bash
npm install -g brainlife
bl login
mkdir input
bl dataset download 5b96bcd9059cf900271924f7 && mv 5b96bcd9059cf900271924f7 input/dwi
```

## Outputs

```text
noddi/
├── ndi.nii.gz     neurite density index (AMICO FIT_ICVF)
├── odi.nii.gz     orientation dispersion index (FIT_OD)
├── isovf.nii.gz   isotropic volume fraction (FIT_ISOVF)
└── dir.nii.gz     principal fibre directions (FIT_dir)
mask/
└── mask.nii.gz    brain mask used for the fit (the one you provided, or the FSL bet mask)
product.json       records the dPar value as a datatype tag
```

## Troubleshooting

- **`output missing`**: no brain mask was produced or provided. Provide a DWI-space brain mask, or check the FSL `bet` step in the log.
- **`NODDI AMICO failed`**: the AMICO fit did not produce the NDI map. Check the log of `NODDI.py`; the multi-shell App needs multi-shell DWI.
- **The provided mask still contains non-brain tissue**: set `advancedMask` to `true`. The App then multiplies your mask by an FSL `bet` mask of the b=0 image.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Zhang H, Schneider T, Wheeler-Kingshott CA, Alexander DC. NODDI: practical in vivo neurite orientation dispersion and density imaging of the human brain. *NeuroImage* 61(4):1000–1016 (2012). [doi:10.1016/j.neuroimage.2012.03.072](https://doi.org/10.1016/j.neuroimage.2012.03.072)
- Daducci A, Canales-Rodríguez EJ, Zhang H, Dyrby TB, Alexander DC, Thiran JP. Accelerated Microstructure Imaging via Convex Optimization (AMICO) from diffusion MRI data. *NeuroImage* 105:32–44 (2015). [doi:10.1016/j.neuroimage.2014.10.026](https://doi.org/10.1016/j.neuroimage.2014.10.026)
- NODDI Amico (single shell) - Deprecated. brainlife.io App. [doi:10.25663/brainlife.app.229](https://doi.org/10.25663/brainlife.app.229)
- Noddi Amico - Deprecated. brainlife.io App. [doi:10.25663/brainlife.app.117](https://doi.org/10.25663/brainlife.app.117)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Brad Caron

**Contributors:** Soichi Hayashi, Franco Pestilli

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE). AMICO and FSL are distributed under their own licenses.
