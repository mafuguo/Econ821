function cS = const_olg2d(calNo)
% Return value of constants
% ---------------------------------------------

cS = const_821;

cS.dbg = 111;
% Baseline experiment
cS.expBase = 1;


%%  Fixed model params

% *** Demographics ***

% Period length
cS.pdLength = 30;

cS.popGrowthAnnual = 1.01;


% *** Household ***

% Curvature of utility function
cS.sigma = 2;

% Default value for discount factor
cS.beta = 0.98;

% Consumption floor. Introduced for numerical reasons.
cS.cFloor = 1e-4;


% ***  Technology  ***

cS.capShare = 0.36;



%%  Calibration targets 

% Interest rate per period, after tax
cS.tgIntRateAnnual = 1.05;

% Wage rate when young, after tax
cS.tgWageYoung = 1;

% Wage rate when old, after tax
cS.tgWageOld = 0.6;

% Capital-output ratio
cS.tgKYannual = 2.9;



%%  Cases

if calNo == 1
   % Keep defaults

elseif calNo == 2
   % Log utility
   cS.sigma = 1;

elseif calNo >= 50
   % Keep defaults
   % For additional experiments in uncertainty model

else
   error('Invalid calNo');
end


%% Derived parameters

% Convert to per period values
cS.popGrowth = cS.popGrowthAnnual ^ cS.pdLength - 1;
cS.tgKY = cS.tgKYannual / cS.pdLength;
cS.tgIntRate = cS.tgIntRateAnnual ^ cS.pdLength - 1;




%% Directories

cS.baseDir = cS.olg2dDir;
cS.progDir = cS.baseDir;
cS.outDir  = fullfile(cS.baseDir, 'out');
cS.matDir  = fullfile(cS.baseDir, 'mat');

% Prefixes for file names
cS.calPrefix = sprintf('c%03i_', calNo);


%% Variable names

% Calibrated parameters
cS.vParams = 1;


end