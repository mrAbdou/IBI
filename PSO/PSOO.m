%https://www.youtube.com/watch?v=xPkRL_Gt6PI
%% problem definition

constFunction = @(particule) fitness(particule);
nVar = 2;
varSize = [1 nVar];
QS_min = 2;
QC_min = 6;
QS_max = 10;
QC_max = 8;

%% parameters of PSO

nIterations = 10;
nPop = 5;
w = 2;
c1 = 1;
c2 = 1;

%% initialization

empty_particule.Position = [];
empty_particule.Vilocity = [];
empty_particule.Cost = [];
empty_particule.Best.Position = [];
empty_particule.Best.Cost = [];

particules = repmat(empty_particule, nPop, 1);

for i = 1 : nPop
particules(1).Position = [rand([QS_min QS_max],1,nVar)];
end