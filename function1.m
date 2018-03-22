function y_out = function1(sigma)

C = 23.50604; %option price 
K = 100; %strike price
T = 1; %maturity time 
S0 = 110; %current asset price
r = 0.1; %interest rate
q = 0.01; %divident with continuous rate

d1 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q+0.5*sigma*sigma)*T);
d2 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q-0.5*sigma*sigma)*T);


y_out = normcdf(d1)*S0*exp(-q*T)-normcdf(d2)*K*exp(-r*T)-C;
end