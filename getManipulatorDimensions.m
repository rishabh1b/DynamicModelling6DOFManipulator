clc
% Script to get the dimensions with the constraint of overall weight of the
% manipulator = 98KG. Density, the radii, breadth and heights are the
% variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Chosen Ones are :
% first link: r = 0.098, h = l1, 
% Second link: l = l2, b = h = 0.15
% Fourth Link: l = l4, b = h = 0.146
% Sixth Link: r = 0.108, h = l6
%Density is 3200 kg/m^3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

l1 = 0.200;
l2 = 0.360;
l4 = 0.380;
l6 =0.065;
fprintf('\n\tr\t\t\ta1\t\t\ta2\t\t\ta3\t\t\trho\t\t\tW1\t\t\tW2\t\t\tW3\t\t\tW4\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%r is the radius of the cylinder of the first link,
%a1 is the height and breadth of the second link
%a2 is the height and breadth of the fourth link
%a3 is the radius of the sixth link
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for r = 0.08:0.004:0.1
    for a1 = 0.13:0.004:0.15
        for a2 = 0.13:0.004:0.15
            for a3 = 0.1:0.001:0.11
            rho = 78 / (pi * r^2 * l1 + l2 * a1 * a1 + l4 * a2 * a2 + pi * l6 * a3 * a3);
            W1 = pi * r^2 * l1 * rho;
            W2 = l2 * a1 * a1 * rho;
            W3 = l4 * a2 * a2 * rho;
            W4 = pi * l6 * a3 * a3 * rho;
            fprintf('%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',r,a1,a2,a3,rho,W1,W2,W3,W4);
            end
        end
    end
end