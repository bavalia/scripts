% % numc = 0.125*[1 .43]
% % denc = conv(poly([0 -1.23]),[1 .226 .0169])
% 
% numc = 361
% denc = [1 16 361]
% 
% syms s t
% G = poly2sym(numc)/poly2sym(denc)
% g = ilaplace(G)
% vpa(g,3)
% ts = 0:1:100;
% %[y,x] = step(G,t);
% %v1 = eval(subs(g,t));
% 
% [K,p,k] = residue(numc,denc);
% %eq = exp()
% %eq2 = vpa(sum(K.*exp(p*t)),3)
% phi = atan(real(K(2))/abs(imag(K(2))))
% val = exp(real(p(2))*t)*2*cos(abs(imag(p(2))*t-phi) %what is abs for?