
%% Steady-State Cooling System Calculations with Radiator Sizing

clc; clear;

%% PARAMETERS

% Heat Load
Q_dot = 2000;                  % Heat load from X-ray tube (W)
deltaT = 5;                    % Allowed coolant temperature rise (°C)

% Water properties (at ~25°C)
rho = 997;                     % kg/m^3
cp = 4181;                     % J/kg·K
mu = 0.00089;                  % Pa·s
k = 0.6;                       % W/m·K

% Pipe
D = 0.01;                      % Pipe diameter (m)
L = 5;                         % Pipe length (m)
eps = 0.0001;                  % Roughness (m)

% Pump
pump_eff = 0.7;

% Radiator / Heat Exchanger
T_air_in = 25;                % Ambient air temp (°C)
T_cold_out = 30;              % Desired coolant outlet temp (°C)
T_hot_in = T_cold_out + deltaT;  % Coolant enters radiator at higher temp

%% 1. Mass Flow Rate
m_dot = Q_dot / (cp * deltaT);        % kg/s
V_dot = m_dot / rho;                  % m^3/s
V_dot_LPM = V_dot * 1000 * 60;        % L/min

%% 2. Pipe Calculations
A = pi * (D/2)^2;
v = V_dot / A;
Re = rho * v * D / mu;

if Re < 2300
    f = 64 / Re;
else
    f = 0.25 / (log10(eps/(3.7*D) + 5.74/Re^0.9))^2;
end

dp = f * (L/D) * 0.5 * rho * v^2;
W_pump = (dp * V_dot) / pump_eff;

%% 3. Radiator Sizing (UA via LMTD method)
deltaT1 = T_hot_in - T_air_in;
deltaT2 = T_cold_out - T_air_in;

if deltaT1 == deltaT2
    deltaT_lm = deltaT1;
else
    deltaT_lm = (deltaT1 - deltaT2) / log(deltaT1 / deltaT2);
end

UA_required = Q_dot / deltaT_lm;     % W/K

%% Display Results
fprintf('--- Steady-State Cooling Calculations with Radiator ---\n');
fprintf('Heat load: %.1f W\n', Q_dot);
fprintf('Allowed coolant ΔT: %.1f °C\n', deltaT);
fprintf('Coolant flow rate: %.4f kg/s (%.2f L/min)\n', m_dot, V_dot_LPM);
fprintf('Flow velocity: %.2f m/s\n', v);
% fprintf('Reynolds number: %.0f -> %s\n', Re, Re < 2300 , 'Laminar' : 'Turbulent');
fprintf('Pipe pressure drop: %.1f Pa\n', dp);
fprintf('Pump power required: %.2f W (%.0f%% eff)\n', W_pump, pump_eff*100);
fprintf('--- Radiator Sizing ---\n');
fprintf('Coolant Inlet Temp: %.1f °C\n', T_hot_in);
fprintf('Coolant Outlet Temp: %.1f °C\n', T_cold_out);
fprintf('Ambient Air Temp: %.1f °C\n', T_air_in);
fprintf('Log Mean Temp Diff (LMTD): %.2f °C\n', deltaT_lm);
fprintf('Required UA: %.2f W/K\n', UA_required);
