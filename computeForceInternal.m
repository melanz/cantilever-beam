function fint = computeForceInternal(e, l, A, E, I)
[wt_l,pt_l] = gaussQuadrature('5point');
%[wt_b,pt_b] = gaussQuadrature('2point');
%[wt_h,pt_h] = gaussQuadrature('2point');

%e=ones(12,1);
%e=[1 2 3 4 5 6 7 8 9 10 11 12]';

fint1=zeros(12,1);
for i = 1:size(pt_l, 1)
    x = l*(1 + pt_l(i))/2;
    %xblah(i)=x;
    
    %strain = axStrain(x, l, e);
    %D = elasticCoefficient(E, v);
    %strainD = axStrainDerivative(x, l, e);
    [strain,strainD] = axStrainDerivative(x, l, e);
    
    fint1 = fint1 + (strainD'*strain)*wt_l(i);
end
fint1=A*E*fint1*l/2;

[wt_l,pt_l] = gaussQuadrature('3point');

fint2=zeros(12,1);

for i = 1:size(pt_l, 1)
    x = l*(1 + pt_l(i))/2;
    
    %k = curvat(x,l,e);
    %k_e = curvat_deriv(x,l,e);
    [k,k_e] = curvat_deriv(x,l,e);
    
    fint2 = fint2 + (k_e'*k)*wt_l(i);
end
fint2=I*E*fint2*l/2;


fint=fint1+fint2;
%fint=fint1