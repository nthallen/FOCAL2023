%%
chars_per_sample = 51;
sample_rate = 20; % Hz
nominal_file_size = 40*1024;
samples_per_file = floor(nominal_file_size/chars_per_sample);
seconds_per_file = samples_per_file/sample_rate;
files_per_run = ceil(8*3600/seconds_per_file);
dirs_per_run = ceil(files_per_run/60);