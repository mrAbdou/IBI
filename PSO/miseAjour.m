function [ updatedParticule ] = miseAjour( particule, vitesse)
p = particule;
p1 = p(1,1) + vitesse(1,1);
if p1 >= 2 && p1 <= 10
p(1,1) = p1;
end
p2 = p(1,2) + vitesse(1,2);
if p2 >= 6 && p2 <= 8
p(1,2) = p2;
end

updatedParticule = p;
end

