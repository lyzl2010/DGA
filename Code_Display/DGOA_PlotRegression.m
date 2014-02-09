% DGOA_PlotRegression
%
% Syntax:
%   DGOA_PlotRegression(w, b, labels)
% Inputs:
%   w:      vector of <n> linear regression weights
%   b:      bias
%   labels: cell array of <n> variable names

% Copyright (C) 2009 Piotr Mirowski
%
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
% Version 1.0, New York, 08 November 2009
% (c) 2009, Piotr Mirowski,
%     Ph.D. candidate at the Courant Institute of Mathematical Sciences
%     Computer Science Department
%     New York University
%     719 Broadway, 12th Floor, New York, NY 10003, USA.
%     email: mirowski [AT] cs [DOT] nyu [DOT] edu

function DGOA_PlotRegression(w, b, labels)

nW = length(w);
figure;
hold on;

dx = max(abs(w)) / 20;

% Loop over all the weights
y_labels{1} = sprintf('%.4f', b);
for k = 1:nW
  if (w(k) > 0)
    col = [1 0 0];
  else
    col = [0 0 1];
  end
  barh(k, abs(w(k)), 'FaceColor', col);
  y_labels{k + 1} = sprintf('%.4f', w(k));
  text(dx + abs(w(k)), k, labels{k}, 'FontSize', 12, 'FontWeight', 'bold');
end

% Axis labels and figure color
grid on;
set(gcf, 'Color', [1 1 1]);
set(gca, 'YTick', 0:nW, 'YTickLabel', y_labels);
xlabel('Linear regression weight');
ylabel('Variable');
