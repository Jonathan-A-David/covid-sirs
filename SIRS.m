function dYdt = SIRS(t, Y, beta, gamma, sigma)
% MA332 Project 2 SIRS model code

% Jonathan David Feb. 19 2024

    S = Y(1); 
    I = Y(2);
    R = Y(3);
    N = S + I + R; 

    dSdt = -beta * S * I / N + sigma * R;
    dIdt = beta * S * I / N - gamma * I;
    dRdt = gamma * I - sigma * R;

    dYdt = [dSdt; dIdt; dRdt];
end