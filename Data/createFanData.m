%% 
%% Load static pressure gain data extracted with Graph Data Extractor
load(projRoot+"\Data\DataSheetFan_dp.mat")
fanSpeedRPM_LUT = [2150;2450;2600];
fanDPPa_LUT = tableData(:, 2:end)';
fanVdotM3H_LUT = tableData(:, 1);



%% Load brake power data extracted with Graph Data Extractor and interpolate flow rate values to ensure consistency with the pressure map
load(projRoot+"\Data\DataSheetFan_Pwr.mat")
fanPkW_LUT = interp1(tableData(:,1),tableData(:,2:end),fanVdotM3H_LUT,'spline')';

%% Plot resulting maps
figure
tiledlayout(2,1)

nexttile
plot(fanVdotM3H_LUT,fanDPPa_LUT')
xlabel('Volumteric flow rate [m^3/s]')
ylabel('Static pressure gain [Pa]')

nexttile
plot(fanVdotM3H_LUT,fanPkW_LUT')
xlabel('Volumteric flow rate [m^3/s]')
ylabel('Brake power [kW]')

%% Save data to .mat

save(projRoot + "\Data\fanData.mat", "fanSpeedRPM_LUT", "fanVdotM3H_LUT", "fanDPPa_LUT", "fanPkW_LUT");