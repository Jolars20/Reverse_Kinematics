clear u v x y
syms u v x y
eqn1 = x + 2*y == u;
eqn2 = x + y == v;
solve(eqn1, eqn2)
%% 
syms x
eqn = sin(x) == cos(x)
solve(eqn,x)
%% 
syms x y z
sola = solve(1 == 1)
%% 
clear
syms x y a

[solx,soly] = solve(x^2*y^2 == 0, x-y/2 == a)
%% 
clc, clear
syms a b c x
eqn = a*x^2 + b*x + c;
solx = solve(eqn)
%% 
clc, clear
syms x

e = x^2 - 9;
solve(e) 