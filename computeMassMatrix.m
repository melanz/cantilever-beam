function mass = computeMassMatrix(rho, l, A)
[wt_l,pt_l] = gaussQuadrature('4point');
%[wt_b,pt_b] = gaussQuadrature('2point');
%[wt_h,pt_h] = gaussQuadrature('2point');
%N = ancf_shape (x, y, z, l);

mass=zeros(12,12);
for i = 1:size(pt_l, 1)
    x = l*(1 + pt_l(i))/2;
    N = ancf_shape (x,l);
    mass = mass + rho*(N'*N)*wt_l(i);
end
   
mass=A*mass*l/2;