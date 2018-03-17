function out = rotateBvecs()

switch getenv('ENV')
case 'IUHPC'
    disp('loading paths (HPC) - hayashis')
    addpath(genpath('/N/u/brlife/git/vistasoft'))
    addpath(genpath('/N/u/brlife/git/jsonlab'))
case 'VM'
    disp('loading paths (VM)')
    addpath(genpath('/usr/local/vistasoft'))
    addpath(genpath('/usr/local/jsonlab'))
end

config = loadjson('config.json');

% Set directories
bvecs_pre = fullfile(config.bvecs);
outAcpcTransform = load(fullfile('acpcxform.mat'),'-ASCII');
outBvecs = fullfile('dwi.bvecs');

% Rotate bvecs
bvecs = dtiRawReorientBvecs(bvecs_pre,[],outAcpcTransform,outBvecs);
exit;
end
