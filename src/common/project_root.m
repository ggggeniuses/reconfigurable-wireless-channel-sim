function root = project_root()
%PROJECT_ROOT Return the repository root for this MATLAB project.
thisFile = mfilename('fullpath');
root = fileparts(fileparts(fileparts(thisFile)));
end
