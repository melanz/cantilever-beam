function k = curvat(x,l,e)
S = ancf_shapeDerivative (x,l);
SS = ancf_shapeDerivative2 (x,l);
d = zeros(4,3);

for i=1:4
    d(i,:) = [e(3*i-2) e(3*i-1) e(3*i)];
end

r_x=d'*S';
r_xx=d'*SS';

f=norm(cross(r_x,r_xx));
g=(norm(r_x))^3;

k=f/g;
