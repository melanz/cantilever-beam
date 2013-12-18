function strain = axStrain(x, l, e)
S = ancf_shapeDerivative (x,l);
d = zeros(4,3);

for i=1:4
    d(i,:) = [e(3*i-2) e(3*i-1) e(3*i)];
end


strain = 1/2*(S*d*d'*S'-1);


