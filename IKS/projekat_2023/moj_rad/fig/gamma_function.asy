import graph;

size(400,200,IgnoreAspect);

real d = 1 / sqrt(2);

real gamma(real k) {return 0.5*(sqrt((-3*d^2*(k^2-1)-8*k^2)/(d^2*(k^2-1))));}

real kmin = 0.4;
real kmax = 0.8;

draw(graph(gamma,kmin,kmax),blue,"$\gamma(k)$");

xaxis("$k$",BottomTop,LeftTicks(trailingzero));
yaxis("$\gamma(k), \,\,\, x(\gamma)$",LeftRight,RightTicks(trailingzero));

// Calculate the intersection point where gamma = 1
real k_intersection = 0.551619325895164;
real gamma_intersection = 1;

// Draw the red dotted line for gamma = 1
draw((kmin, 1) -- (k_intersection, 1), red + dashed);
draw((k_intersection, gamma_intersection) -- (k_intersection, 0), red + dashed);
dot((k_intersection, gamma_intersection), red);

// Add text at the specified coordinates
label("$(0.552, 1)$", (k_intersection, gamma_intersection), SE);

