% NN_Predict  Prediction with a single hidden-layer NN
%
% Syntax:
%   yBar = NN_Predict(x, model)
% Inputs:
%   x:       matrix of size <dim_x> x <n> of inputs
%   model:   struct containing the model
% Outputs:
%   yBar:    matrix of size <dim_y> x <n> of predictions

% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% Version 1.0, New York, 18 September 2010
% (c) 2010, Piotr Mirowski,
%     Ph.D. candidate at the Courant Institute of Mathematical Sciences
%     Computer Science Department
%     New York University
%     719 Broadway, 12th Floor, New York, NY 10003, USA.
%     email: mirowski [AT] cs [DOT] nyu [DOT] edu

function yBar = NN_Predict(x, model)

% Make the predictions
yBar = NN_Model_ForwardProp(x, model);

% Apply the nonlinearity
if isequal(model.output, 'logistic')
  yBar = NN_Logistic(yBar);
end
