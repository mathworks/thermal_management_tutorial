%% Load pump data extracted with Graph Data Extractor
load(projRoot + filesep + "Data" + filesep + "DataSheetPump_Head.mat")
pumpVdotLPM_LUT = tableData(:,1);
pumpHeadm_LUT = tableData(:,2);

load(projRoot + filesep +  "Data" + filesep + "DataSheetPump_Pwr.mat")
pumpPW_LUT = interp1(tableData(:,1),tableData(:,2:end),pumpVdotLPM_LUT,"linear", "extrap");


%% Plot resulting maps
figure

yyaxis left
plot(pumpVdotLPM_LUT,pumpHeadm_LUT)
xlabel('Volumetric flow rate [lpm]')
ylabel('Pump head [m]')

yyaxis right
plot(pumpVdotLPM_LUT,pumpPW_LUT)
xlabel('Volumetric flow rate [lpm]')
ylabel('Pump break power [W]')

%% Save data to .mat

save(projRoot + filesep + "Data" + filesep + "pumpData.mat", "pumpVdotLPM_LUT", "pumpHeadm_LUT", "pumpPW_LUT");