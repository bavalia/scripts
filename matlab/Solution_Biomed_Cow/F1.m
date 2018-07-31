function F1_X = F1(X)

global Vcl Vol

[f, g1, g2] = Sub_fun(X);

F1_X = (1/Vol) * (g1 + f*g2 - Vcl);
