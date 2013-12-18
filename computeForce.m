function fext = computeForce(rho, l, A)
[wt_l,pt_l] = gaussQuadrature('2point');
%[wt_b,pt_b] = gaussQuadrature('1point');
%[wt_h,pt_h] = gaussQuadrature('1point');
%N = ancf_shape (x, y, z, l);
q = [0; -rho*9.81; 0];
fext=zeros(12,1);
for i = 1:size(pt_l, 1)
    x = l*(1 + pt_l(i))/2;
    N = ancf_shape (x,l);
    fext = fext + (N'*q)*wt_l(i);
end
 
fext=A*fext*l/2;
    