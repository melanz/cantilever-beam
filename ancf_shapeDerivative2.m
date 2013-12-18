function SS = ancf_shapeDerivative2 (x, l)
xi = x/l;

%a1=[(6*xi^2-6*xi)/l 1-4*xi+3*xi^2 -(6*xi^2-6*xi)/l -2*xi+3*xi^2];
a1=[(12*xi-6)/l^2 (-4+6*xi)/l (6-12*xi)/l^2 (-2+6*xi)/l];
SS = a1;

