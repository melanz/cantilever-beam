function [k,k_e] = curvat_deriv(x,l,e)
S = ancf_shapeDerivative (x,l);
SS = ancf_shapeDerivative2 (x,l);
d = zeros(4,3);

Sd1 = [S(1,1)*eye(3) S(1,2)*eye(3) S(1,3)*eye(3) S(1,4)*eye(3)];
Sd2 = [SS(1,1)*eye(3) SS(1,2)*eye(3) SS(1,3)*eye(3) SS(1,4)*eye(3)];

for i=1:4
    d(i,:) = [e(3*i-2) e(3*i-1) e(3*i)];
end

r_x=d'*S';
r_xx=d'*SS';
% if norm(r_xx)==0
%     r_xx=[0;1;0];
% end

f1=cross(r_x,r_xx); %f1 is equal to fm in maple/c
f=norm(f1);
g1=norm(r_x); %g1 is equal to gint in maple/c
g=g1^3;

k=f/g;

g_e=3*g1*S*d*Sd1;

r_xxrep=r_xx*ones(1,12);
r_xrep=r_x*ones(1,12);

fe1=cross(Sd1,r_xxrep)+cross(r_xrep,Sd2);

if f==0
    fspecial=1;
    f_e=(1/fspecial)*f1'*fe1;
else
    fspecial=f;
f_e=(1/fspecial)*f1'*fe1;
end


k_e=(g*f_e-f*g_e)/(g^2);

%norm(k_e)