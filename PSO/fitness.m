function [ val_fit ] = fitness( particule )
val_fit = (sqrt(particule(1,1)) - pow2(particule(1,1)))/(log(particule(1,2))*cos(particule(1,1)));
end

