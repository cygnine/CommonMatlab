function[common]=makepaths();

% Creates common access paths for functions. Is accessed by many functions
%
% acn

common.base = '/home/akil/work/matlab/common/';

% RBM paths:
% common.rbm.base = strcat(common.base, 'rbm/');
% common.rbm.infsup = strcat(common.rbm.base, 'inf_sup_lowerbound/');
% common.rbm.residual = strcat(common.rbm.base, 'residual_estimator');
% common.rbm.helmholtz1d = strcat(common.rbm.base, 'maxwell1d/helmholtz/');

% Quadrature/basis paths
common.quadrature.base = strcat(common.base, 'quadrature/');
common.quadrature.d1 = strcat(common.quadrature.base, '1d/');
common.quadrature.d2 = strcat(common.quadrature.base, '2d/');
common.bases.base = strcat(common.base, 'bases/');
common.bases.d1.base = strcat(common.bases.base, '1d/');
%common.bases.d1.jacobi = strcat(common.bases.d1.base, 'jacobi/');
%common.bases.d1.claguerre = strcat(common.bases.d1.base, 'complex_laguerre/');
%common.bases.d1.rlaguerre = strcat(common.bases.d1.base, 'real_laguerre/');
%common.bases.d1.rgenwe = strcat(common.bases.d1.base, 'genwe/');
%common.bases.d1.cgenwe = strcat(common.bases.d1.base, 'c_genwe/');
common.bases.d1.fourier = strcat(common.bases.d1.base, 'fourier/');
%common.bases.d1.fourier.aux = strcat(common.bases.d1.fourier.base, 'aux/');
%common.bases.d1.rgwe.base = strcat(common.bases.d1.base, 'rgwe/');
%common.bases.d1.rgwe.aux = strcat(common.bases.d1.rgwe.base, 'aux/');
%common.bases.d1.cgwe.base = strcat(common.bases.d1.base, 'cgwe/');
common.bases.d1.opoly = strcat(common.bases.d1.base, 'opoly/');
common.bases.d1.ratfun.base = strcat(common.bases.d1.base, 'ratfun/');
common.bases.d1.ratfun.mappings = strcat(common.bases.d1.ratfun.base, 'mappings/');
common.bases.d1.sinc = strcat(common.bases.d1.base, 'sinc/');
common.bases.d1.newton.base = strcat(common.bases.d1.base, 'newton/');
common.bases.d1.monomial.base = strcat(common.bases.d1.base, 'monomial/');
common.filter = strcat(common.base, 'filter/');
common.bases.d2 = strcat(common.bases.base, '2d/');

% Construction of transformations and standard elements
common.transform.base = strcat(common.base, 'transform/');
common.transform.filter = strcat(common.transform.base, 'filter/');
common.transform.aux = strcat(common.transform.base, 'aux/');

% ODE integration
common.tstep = strcat(common.base, 'integrate_ode/');

% DG
common.dg.base = strcat(common.base, 'dg_construction/');
common.dg.grid = strcat(common.dg.base, 'grid/');
common.dg.aux = strcat(common.dg.base, 'auxilliary/');
common.dg.ldg = strcat(common.dg.base, 'ldg/');
common.dg.part = strcat(common.dg.base, 'particle_functions/');
common.dg.nodal = strcat(common.dg.base, 'nodal_functions/');
common.dg.modal = strcat(common.dg.base, 'modal_functions/');
common.dg.gridaux = strcat(common.dg.base, 'grid_functions/');
common.dg.boundary = strcat(common.dg.base, 'boundary/');
common.dg.interpolate = strcat(common.dg.base, 'interpolation/');

% Spectral/spectral element
common.spectral.base = strcat(common.base, 'spectral_construction/');
common.spectral.grid = strcat(common.spectral.base, 'grid/');

% Rootfinding
common.fsolve.base = strcat(common.base, 'funsolve/');

% Distmesh
common.distmesh.base = strcat(common.base, 'distmesh/');

% Particles/PIC
common.pic.base = strcat(common.base, 'pic/');
common.pic.shape.base = strcat(common.pic.base, 'shape/');
common.pic.shape.d1 = strcat(common.pic.shape.base, '1d/');
common.pic.load.base = strcat(common.pic.base, 'partload/');
common.pic.load.d1 = strcat(common.pic.load.base, '1d/');

% Schwartz-Christoffel mapping
common.sc.base = strcat(common.base, 'sc/');
common.sc.driscoll = strcat(common.sc.base, 'driscoll/sc');

% Shape stuff
common.shape.base = strcat(common.base, 'shape/');
common.shape.feiszli.base = strcat(common.shape.base, 'feiszli/shapestuff/');
common.shape.metrics.base = strcat(common.shape.base, 'metrics/');

% Complex analysis stuff
common.complex.base = strcat(common.base, 'complex/');

% Moebius transformation stuff
common.complex.moebius.base = strcat(common.complex.base, 'moebius');

% Finite difference stuff
common.FiniteDifference.base = strcat(common.base, 'FiniteDifference/');

% (W)Eno paths
common.eno.base = strcat(common.base, 'eno/')

%%%%%%%%%%%%%%%%%% M. Feiszli's paths %%%%%%%%%%%%%%%%%%%%
common.shape.feiszli.util = strcat(common.shape.feiszli.base,'support/util');
common.shape.feiszli.support.axis = strcat(common.shape.feiszli.base,'support/shape/axis');
common.shape.feiszli.support.common = strcat(common.shape.feiszli.base,'support/shape/common');
common.shape.feiszli.support.hilbert = strcat(common.shape.feiszli.base,'support/shape/hilbert-riemann');
common.shape.feiszli.support.iota = strcat(common.shape.feiszli.base,'support/shape/iota');
common.shape.feiszli.support.weld = strcat(common.shape.feiszli.base,'support/shape/weld');
common.shape.feiszli.support.WP = strcat(common.shape.feiszli.base,'support/shape/WP-metric');
