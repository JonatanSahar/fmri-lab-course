
function [images] = get_session_data(folder_path, filePrefix)


d=dir(strcat(folder_path, "\", filePrefix, '*.nii'));
files={d.name}';

images = cellstr(strcat(folder_path , "\", files,',1'));
