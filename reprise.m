%--------------------------------------------------------------------------
% PURPOSE
%    Test restart option - 2D test - Mazars' model
%--------------------------------------------------------------------------
% REFERENCES
%    Benjamin RICHARD
%    CEA, DEN, DANS, DM2S, SEMT, EMSI
%    benjamin.richard[at]cea.fr
%    11-10-2017
%--------------------------------------------------------------------------
% COMMENTS
% 
% 
%--------------------------------------------------------------------------

%% Clearing off
fclose all;
clear 
close all

%% Declaration de variables global
global options ME TP;

%% Definition des options
options.mode = 'PLANE_STRESS';

%% Loading of the input datafile
FILE  = 'reprise.mail';
ME = INPUT.ACQU(FILE,'MAIL');

%% Definition of the model
MO1  = MODEL('ST','MECHANICS','ELASTICITY','ISOTROPIC','DAMAGE','MAZARS');
MOT  = MO1;

%% Topology
TP   = TOPOLOGY(MOT);

%% Definition of the material
MA1  = CHAMELEM.MATE(MO1,'youn',36000e6,'nu',0.2);
MAT  = MA1;

%% Boundary conditions

% Line L1 fixed
CL1  = MATRICE('DIRI','P1',1,2);
CL2  = MATRICE('DIRI','P2',2);
CL3  = MATRICE('DIRI','P34',2);
CLT  = [CL1 [CL2 CL3]];

% Definition of a prescribed displacement
FO1  = CHPOINT.DEPI(CL3,-1);

%% Loading
EV1 = EVOL([0 1 2],[0 6.5e-4 0],'Time','Displacement (m)');
CHT = TIMELOAD(FO1,EV1,'DIRI');

LI1 = 0:0.1:2;

%% Static analysis - STEP 1
PB1 = PROBLEM('model',MOT,'mater',MAT,'diric',CLT,'loadt',CHT,'comp_time',LI1,...
     'solve_type','QUASI_NEWTON');
SOL1 = SOLVERS(PB1);

EV_1 = EVOL.REAC(SOL1,CL3,EV1,2,'P34',1);

%% Static analysis - STEP 2
% Clear off the curent topology
clearvars -global TP;
global TP

TP = TOPOLOGY(MOT);

% Set up the new BCs
CL1bis  = MATRICE('DIRI','P3',1,2);
CL2bis  = MATRICE('DIRI','P4',2);
CL3bis  = MATRICE('DIRI','P12',2);
CLTbis  = [CL1bis [CL2bis CL3bis]];

% Definition of a prescribed displacement
FO1bis  = CHPOINT.DEPI(CL3bis,1);

%% Loading
EV1bis = EVOL([0 1 2],[0 6.5e-4 0],'Time','Displacement (m)');
CHTbis = TIMELOAD(FO1bis,EV1bis,'DIRI');

PB2 = PROBLEM('model',MOT,'mater',MAT,'diric',CLTbis,'loadt',CHTbis,'comp_time',LI1,...
     'solve_type','QUASI_NEWTON',...
     'restart',true,'cham',SOL1.result(end).cham,'displacement',SOL1.result(end).displacement);
SOL2 = SOLVERS(PB2);

EV_2 = EVOL.REAC(SOL2,CL3bis,EV1bis,2,'P12',1);

EVTOT = [EV_1 EV_2];
plot(EVTOT);

return
%% Post-treatment

% Displacement at point P3 X and Y
EV_OUT = EVOL.REAC(SOL,CL1,EV1,2);
plot(EV_OUT);

close all

%% Non regression test
if abs(EV_OUT.ordo(end) - 1.014111323244210e+04)/1.014111323244210e+04 > 1.0e-4

    error('TEST IS NOT SUCCESSFUL')
    
else
    
    disp('---------------------------------')
    disp('068_INCR_ZAFATI_QUASI_NEWTON')
    disp('TEST IS SUCCESSFUL')
    disp('---------------------------------')
    
end