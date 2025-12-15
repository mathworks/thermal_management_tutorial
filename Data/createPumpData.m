%% Load pump data extracted with Graph Data Extractor
load(projRoot + "\Data\DataSheetPump.mat")
pumpVdotLPM_LUT = tableData(:,1);
pumpHeadm_LUT = tableData(:,2);
pumpPW_LUT = tableData(:,3);


%% Plot resulting maps
figure

yyaxis left
plot(pumpVdotLPM_LUT,pumpHeadm_LUT)
xlabel('Volumteric flow rate [lpm]')
ylabel('Pump head [m]')

yyaxis right
plot(pumpVdotLPM_LUT,pumpPW_LUT)
xlabel('Volumteric flow rate [lpm]')
ylabel('Pump break power [W]')

%% Save data to .mat

save(projRoot + "\Data\pumpData.mat", "pumpVdotLPM_LUT", "pumpHeadm_LUT", "pumpPW_LUT");