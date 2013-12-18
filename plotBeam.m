function plotBeam( e, l, el)
%PLOTBEAM Summary of this function goes here
%   Detailed explanation goes here
    numPointsPerBeam = 10;
    for ii=0:el-1
        e_el = e(6*ii+1:6*ii+12,1);
        for i=1:numPointsPerBeam
            x = (i-1)*l/(numPointsPerBeam-1);
            N = ancf_shape(x,l);
            pos = N*e_el;
            plot(pos(1,1),pos(2,1),'o');
            xlim([-1 1]);
            ylim([-1 1]);
            axis square;
            hold on;
        end
    end
    hold off;
end

