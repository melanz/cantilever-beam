clc;
clear all;

%Model Details
el=4;
nodes=el+1;
dof=6*nodes;
lend=1;
l=lend/el;
r=0.02;
A=pi*r^2;
rho=7200;
E=2e7;
Ibar=.25*pi*r^4;

%simulation parameters
tend=2;
hh=1e-4;
t=0:hh:tend;

%Initial config for horizontal pendulum
p=zeros(dof,1);
pzero=zeros(6,1);
pzero(4,1)=1;
for ii=0:el
    pzero(1,1)=ii*l;
    p(6*ii+1:6*ii+6)=pzero;
end
v=zeros(dof,1);

%Mass Matrix
M=zeros(dof);   
Mel=computeMassMatrix(rho, l, A);
for ii=0:el-1
    M(6*ii+1:6*ii+12,6*ii+1:6*ii+12)=M(6*ii+1:6*ii+12,6*ii+1:6*ii+12)+Mel;
end
M_new=M(7:dof,7:dof);
M_new=sparse(M_new);
Min=inv(M_new);

%External Force
fext=zeros(dof,1);
fext_el=computeForce(rho, l, A);
for ii=0:el-1
    fext(6*ii+1:6*ii+12,1)=fext(6*ii+1:6*ii+12,1)+fext_el;
end
fext_new=fext(7:dof,1);

p_store=zeros(dof,length(t));
p_store(:,1)=p;

for i=2:length(t)
    
    fint=zeros(dof,1);
    for ii=0:el-1
        pel=p(6*ii+1:6*ii+12,1);
        fint_el=computeForceInternal(pel, l, A, E, Ibar);
        fint(6*ii+1:6*ii+12,1)=fint(6*ii+1:6*ii+12,1)+fint_el;
    end
    fint_new=fint(7:dof,1);
    
    a=Min*(fext_new-fint_new);
    
    v(7:dof,1)=v(7:dof,1)+hh*a;
            
    p=p+hh*v;
    
    p_store(:,i)=p;
    
    if(mod(i,100)==0)
        plotBeam(p, l, el);
    	pause(0.01);
    end
    
    t(i)
end