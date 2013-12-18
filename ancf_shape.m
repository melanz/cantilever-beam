function S = ancf_shape (x,l)
xi = x/l;


s1 = 1 - 3*xi^2 + 2*xi^3;
s2 = l*(xi - 2*xi^2 + xi^3);
s3 = 3*xi^2 - 2*xi^3;
s4 = l*(-xi^2 + xi^3);


S = [s1*eye(3) s2*eye(3) s3*eye(3) s4*eye(3)];


