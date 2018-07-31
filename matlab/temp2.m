% % numc = 0.125*[1 .43]
% % denc = conv(poly([0 -1.23]),[1 .226 .0169])
% 
% numc = [73.626]
% denc = conv(poly([0 -3]),[1 4 24.542])
% 
% [K,p,k] = residue(numc,denc);
% n = 2
% a= real(p(n))
% b= imag(p(n))
% c= real(K(n))
% d= imag(K(n))
% phi = atan(d/c);
% phi*180/pi
% val2 = vpa(2*exp(a*t)*sqrt(c^2+d^2)*cos(b*t+phi),3)

% figure 8.10 pg-399
% t = 0:999;
% k = t/10000.*exp(t/100);
% r = zeros(length(k),3);
% for n=1:length(k); kn=k(n); r=roots([(1+kn),(3+7*kn),(2+12*kn)]); scatter(real(r),imag(r));end
% for n=1:length(k);
%     kn = k(n)/10;
%     r(n,:)=roots([(1+kn),(3+7*kn),(2+12*kn)]);
%     r(n,:)=roots(poly([0 -1 -10])+kn*[0 0 1 1.5]);
% end
% cla(); hold on;
% for n=1:length(r(1,:)); scatter(real(r(:,n)),imag(r(:,n)),'.'); end
% plot(real(r(:,1)),imag(r(:,1)));
% plot(real(r(:,2)),imag(r(:,2)));
% r1= r(1,:)'; scatter(real(r1),imag(r1),'x');
% rn= r(length(r),:); scatter(real(rn),imag(rn),'o');
% hold off

for j=1:10;
    
[a b] = ginput(1);
t = roots([1, 0, 8-4*a(1), -8*b(1)])
for i=1:numel(t); 
    y = t(i);
    if imag(y)==0;
        %disp(t(i));
        plot([y.^2/4, a(1)],[y,b(1)]); 
    end
end

end

    
