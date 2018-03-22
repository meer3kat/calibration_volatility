function y_out = function0(C,K,S0)

T = 1;
r = -0.0644;

d1 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q+0.5*sigma*sigma)*T);
d2 = 1/(sigma*sqrt(T))*(log(S0/K)+(r-q-0.5*sigma*sigma)*T);


y_out = normcdf(d1)*S0*exp(-q*T)-normcdf(d2)*K*exp(-r*T)-C;
end
