clear;
clc;
close all;
%% problem definition

GoutFunc= @(particule) fitness(particule);
nVar = 2;
varSize = [1 nVar];
QS_min = 2;
QC_min = 6;
QS_max = 10;
QC_max = 8;

%% parameters of PSO

nIterations = 100;
nPop = 50;
w = 2;
c1 = 1;
c2 = 1;

%% initialisation

empty_particule.Position = zeros(varSize);
empty_particule.Vitesse = zeros(varSize);
empty_particule.Gout = zeros(nPop,1);
empty_particule.Meilleur.Position = zeros(varSize);
empty_particule.Meilleur.Gout = zeros(varSize);

particules = repmat(empty_particule, nPop, 1);

for i = 1 : nPop
    particules(i).Position(1,1) = QS_min + (QS_max - QS_min) * rand();
    particules(i).Position(1,2) = QC_min + (QC_max - QC_min) * rand();
    particules(i).Vitesse = rand(varSize);
end


%% evaluation
j = 1;
v = [];
while j <= nIterations
    g = -inf;
    for i = 1 : nPop
        particules(i).Gout = GoutFunc(particules(i).Position);
        if particules(i).Meilleur.Gout <=  particules(i).Gout(1)
            particules(i).Meilleur.Position = particules(i).Position;
            particules(i).Meilleur.Gout = particules(i).Gout(1);
            if g <= particules(i).Meilleur.Gout
                g = particules(i).Meilleur.Gout;
                G = particules(i).Meilleur.Position;
            end
            
        end
        v(j) = g;
        
    end
    
    
    %% formule de vitesse
    for i = 1 : nPop
        particules(i).Vitesse = formule(w,c1,c2,particules(i).Vitesse,G,particules(i).Position,particules(i).Meilleur.Position);
        particules(i).Position = miseAjour( particules(i).Position,particules(i).Position);
    end
    j = j + 1;
end %end loop nbr iterations
plot(v)