% MA332 Project 2 Running SIRS model code

% Jonathan David Feb. 19 2024

T0 = 6785528; % Total population 
I0 = 17432;  % Infectious
S0 = T0 - I0; % Susceptible
R0 = 0;   % Recovered
Y0 = [S0; I0; R0];

beta = 3/10;  % Transmission rate (x new infections / y exposed people) 
gamma = 1/14; % Recovery rate (1/days)
sigma = 1/180; % Waning immunity rate (1/days) 

% 2 year time span (assuming 30 days per month) 
tspan = [0 720];

% Solve ODE for SIRS model
[t, Y] = ode45(@(t,Y) SIRS(t, Y, beta, gamma, sigma), tspan, Y0);

% Plotting the results
figure;
plot(t, Y(:,1), 'b', t, Y(:,2), 'r', t, Y(:,3), 'g');
legend('Susceptible', 'Infectious', 'Recovered');
titleString = sprintf('SIRS Model: Transmission Rate = %.2f, Recovery Rate = %.3f, Waning Immunity Rate = %.4f', beta, gamma, sigma);
title(titleString);
xlabel('Time (days)');
ylabel('Population');