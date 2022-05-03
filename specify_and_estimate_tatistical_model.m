function specify_and_estimate_tatistical_model(dir1, dir2, statPath, filePrefix)
% expects prefix smwc1


group1_images = get_session_data(dir1, filePrefix)
group2_images = get_session_data(dir2, filePrefix)


matlabbatch{1}.spm.stats.factorial_design.dir = cellstr(statPath);
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = group1_images;
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = group2_images;
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tma.athresh = 0.1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm_jobman('run' , matlabbatch);
matlabbatch = [];


matlabbatch{1}.spm.stats.fmri_est.spmmat = cellstr(strcat(statPath, "\SPM.mat"))
matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run' , matlabbatch);
matlabbatch = [];
