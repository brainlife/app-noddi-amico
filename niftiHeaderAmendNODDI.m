function niftiHeaderAmendNODDI()

icvf = niftiRead(fullfile('AMICO','NODDI','FIT_ICVF.nii.gz'));
od = niftiRead(fullfile('AMICO','NODDI','FIT_OD.nii.gz'));
isovf = niftiRead(fullfile('AMICO','NODDI','FIT_ISOVF.nii.gz'));
b0 = niftiRead(fullfile('nodif_brain.nii.gz'));
n_fields_icvf = fieldnames( icvf );
n_fields_od = fieldnames( od );
n_fields_isovf = fieldnames (isovf);
i_fields = fieldnames( b0 );
noddiFiles = {icvf,od,isovf};

% We want to change a few fields that are in the original data but not in
% the data corrupted when running the AMICO code.
fields_oi = {'quatern_b','quatern_c','quatern_d', ...
            'qoffset_x','qoffset_y','qoffset_z', ...
            'xyz_units','time_units', ...
            'qto_xyz', 'qto_ijk', ...
            'sto_xyz', 'sto_ijk', ...
            'qform_code', 'sform_code'};
       
% Check if the fields names are all the same in the two NIFTI files, 
% otherwise we have a problem one of the file might be corrupted
if all(size(n_fields_icvf)~=size(i_fields)); keyboard; end

% now go through the specified fields and match them
for ii = 1:length(noddiFiles)
    for i_f = 1:length(fields_oi)
        noddiFiles{ii}.(fields_oi{i_f}) = b0.(fields_oi{i_f});
    end
    
    noddiFiles{ii}.fname = ([noddiFiles{ii}.fname(1:end-7),'_NEW',noddiFiles{ii}.fname(end-6:end)]);

    niftiWrite(noddiFiles{ii})
end
exit;
end
