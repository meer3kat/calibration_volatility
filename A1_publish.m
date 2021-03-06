%% Assignment 1 Calibration of a single underlier model
%
% Written by Peili Guo (peili.guo.7645@student.uu.se) and Francisco Jos�
% Peralta Alguacil (franciscojose.peraltaalguacil.0481@student.uu.se)
% This report is for Computational Finance: Calibration and Estimation
% Assignment 1. 
%
% In this project, the Black-Scholes model will be used to calibrate the 
% implied volatility with an European call option. In the first part, we 
% compute the volatility from one observation. Meanwhile, in the second 
% part, we will obtain the volatility from several observations with 
% different strike prices. 
%% Part 1 
% In this part, we compute the volatility from a single observed call
% option with strike price K=100 and maturity T = 1. We have the input 
% values listed in the function below, where fzero is called to compute 
% $\sigma$. 

format long
dbtype('function1.m');

%The result is 
sigma = fzero(@function1,0)

%% Part 2
% In this program, we compute the volatility from real market data 
format long
load('SX5E.mat'); %load market data 

r = -0.0644; %interest rate

%change time to appropiate units
t = datenum(SX5E.t);
T = datenum(SX5E.T);

myfun = @(sigma,C,K,S0) normcdf(1/(sigma*sqrt((T-t)/365))*(log(S0/K)+(r-0+0.5*sigma*sigma)*(T-t)/365))*S0*exp(-0*(T-t)/365)-normcdf(1/(sigma*sqrt((T-t)/365))*(log(S0/K)+(r-0-0.5*sigma*sigma)*(T-t)/365))*K*exp(-r*(T-t)/365)-C;

for i=1:70
    C = SX5E.C(i);
    K = SX5E.K(i);
    C0(i) = SX5E.C(i);
    K0(i) = SX5E.K(i);
    S0 = SX5E.S0;
    
    fun = @(sigma) myfun(sigma,C,K,S0);
    
    sigma(i) = fzero(fun,0);
end

%plot of result
plot(K0,sigma);
grid on
xlabel('K (strike price)');
ylabel('Volatility \sigma');
title ('Volatility \sigma from different strike prices');
legend('\sigma');

