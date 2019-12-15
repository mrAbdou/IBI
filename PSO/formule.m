function [ V ] = formule( w,c1,c2,v,g,x,p)
r1 = rand();
r2 =rand();
V = w*v + c1*r1*(p - x) + c2*r2*(g - x);
end

