function [] = coregistration(subject_root_dir, anatomical_nii, mean_functional_nii, filePrefix)
% expects prefix ar*

run1_images = get_session_data(subject_root_dir, filePrefix)

matlabbatch{1}.spm.spatial.coreg.estwrite.ref = anatomical_nii;
matlabbatch{1}.spm.spatial.coreg.estwrite.source = mean_functional_nii;
matlabbatch{1}.spm.spatial.coreg.estwrite.other = run1_images;
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';

spm_jobman('run' , matlabbatch);
matlabbatch = [];
