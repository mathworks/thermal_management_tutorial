% project root folder
proj = currentProject;
projRoot = proj.RootFolder;
cd(projRoot);

% Custom libraries
cd('Libraries');
if((exist('+supplemental')==7) && ~exist('supplemental_lib'))
    disp('Building Custom Simscape Library...');
    sscbuild supplemental;
    disp('Finished Building Library.');
end
cd(projRoot);