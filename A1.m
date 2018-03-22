%Assignment 1 
format long
load('SX5E.mat');
%sigma0 = 0;

%sigma = fzero(@function1,sigma0)

%function1(sigma)

%T = 1;
r = -0.0644;

%d1 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q+0.5*sigma*sigma)*T);
%d2 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q-0.5*sigma*sigma)*T);

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

