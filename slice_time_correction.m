function [] = slice_time_correction(subject_root_dir, filePrefix)

% expects prefix r*

% run1_path = strcat(subject_root_dir, '\Functional\run01');
run1_images = get_session_data(subject_root_dir, filePrefix);

matlabbatch{1}.spm.temporal.st.scans = {
    run1_images
    };
matlabbatch{1}.spm.temporal.st.nslices = 39;
matlabbatch{1}.spm.temporal.st.tr = 3;
matlabbatch{1}.spm.temporal.st.ta = 2.92307;
matlabbatch{1}.spm.temporal.st.so = [1 21 2 22 3 23 4 24 5 25 6 26 7 27 8 28 9 29 10 30 11 31 12 32 13 33 14 34 15 35 16 36 17 37 18 38 19 39 20];
matlabbatch{1}.spm.temporal.st.refslice = 1;
matlabbatch{1}.spm.temporal.st.prefix = 'a';

spm_jobman('run' , matlabbatch);
matlabbatch = [];
