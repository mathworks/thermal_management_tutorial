function initializeParameters(paramFileName)

proj = currentProject;
projRoot = proj.RootFolder;

switch paramFileName
    case "ColdPlate"        
        paramStruct = load(projRoot + filesep +"Data" + filesep + "coldPlateParams.mat");
    case "Pump"
        paramStruct = load(projRoot + filesep +"Data" + filesep + "pumpParams.mat");
    case "Radiator"
        paramStruct = load(projRoot + filesep +"Data" + filesep + "radiatorParams.mat");
    case "CoolingSystem"
        paramStruct = load(projRoot + filesep +"Data" + filesep + "coolingSystemParams.mat");
end

% Assign each field into base workspace
flds = fieldnames(paramStruct);
for i=1:numel(flds)
    varName = flds{i};
    varValue = paramStruct.(varName);
    assignin('base', varName, varValue);
end
  

end