function S = ancf_shapeDerivative (x, l)
xi = x/l;

a1=[(6*xi^2-6*xi)/l 1-4*xi+3*xi^2 -(6*xi^2-6*xi)/l -2*xi+3*xi^2];

S = a1;

end