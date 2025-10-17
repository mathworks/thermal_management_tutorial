function htc = calculateHTCPipe(Dh,area, mdot, ReLam,ReTurb,k,relativeRoughness,mu,Pr)

Re = (mdot * Dh) / (area * mu);

f = 1/(-1.8*log10(6.9/Re+(1/3.7*relativeRoughness)^1.11))^2;

NuTurb = f/8*(Re-1000)*Pr/(1+12.7*sqrt(f/8)*(Pr^(2/3)-1));
NuLam  = 3.66;

Nu = blend(NuLam, NuTurb.value('1'), ReLam, ReTurb, Re.value('1'));

% Heat transfer coefficient
htc = Nu*k/(Dh);  % W/m^2/K


end