function smoothing(subject_root_dir, filePrefix)

% expects prefix wrar


% run1_path = strcat(subject_root_dir, '\Functional\run01');
run1_images = get_session_data(subject_root_dir, filePrefix)

matlabbatch{1}.spm.spatial.smooth.data = run1_images;
matlabbatch{1}.spm.spatial.smooth.fwhm = [12 12 12];
% matlabbatch{1}.spm.spatial.smooth.fwhm = [2 2 2];
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 0;
matlabbatch{1}.spm.spatial.smooth.prefix = 's';

spm_jobman('run' , matlabbatch);
matlabbatch = [];
