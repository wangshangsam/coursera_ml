function file_contents = readFile(filename)
%READFILE reads a file and returns its entire contents
%   file_contents = READFILE(filename) reads a file and returns its entire
%   contents in file_contents
%

% Load File
[fid, msg] = fopen(filename);
if fid == -1
    file_contents = '';
    fprintf('Unable to open %s\n', filename);
    fprintf('Error msg: %s', msg);
else
    file_contents = fscanf(fid, '%c', inf);
    fclose(fid);
end

end
