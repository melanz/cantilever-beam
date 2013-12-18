function [strain,strainD] = axStrainDerivative(x, l, e)
S = ancf_shapeDerivative (x, l);
d = zeros(4,3);

Sd1 = [S(1,1)*eye(3) S(1,2)*eye(3) S(1,3)*eye(3) S(1,4)*eye(3)];

for i=1:4
    d(i,:) = [e(3*i-2) e(3*i-1) e(3*i)];
end


strainD = S*d*Sd1;

strain = 1/2*(S*(d*d')*S'-1);

