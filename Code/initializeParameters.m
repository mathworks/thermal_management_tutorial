function initializeParameters(paramFileName)

proj = currentProject;
projRoot = proj.RootFolder;

switch paramFileName
    case "ColdPlate"        
        paramStruct = load(projRoot + "\Data\coldPlateParams.mat");
    case "Pump"
        paramStruct = load(projRoot + "\Data\pumpParams.mat");
    case "Radiator"
        paramStruct = load(projRoot + "\Data\radiatorParams.mat");
    case "CoolingSystem"
        paramStruct = load(projRoot + "\Data\coolingSystemParams.mat");
end

% Assign each field into base workspace
flds = fieldnames(paramStruct);
for i=1:numel(flds)
    varName = flds{i};
    varValue = paramStruct.(varName);
    assignin('base', varName, varValue);
end
  

end