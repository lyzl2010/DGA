% DGOA_PlotHistPerClass
%
% Syntax:
%   DGOA_PlotHistPerClass(y, label_y, class_idx, class_labels)
% Inputs:
%   y:           vector of length <N> target values
%   label_y:     cell array of char string with names of the classes in <y>

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
% Version 1.0, New York, 24 November 2009
% (c) 2009, Piotr Mirowski,
%     Ph.D. candidate at the Courant Institute of Mathematical Sciences
%     Computer Science Department
%     New York University
%     719 Broadway, 12th Floor, New York, NY 10003, USA.
%     email: mirowski [AT] cs [DOT] nyu [DOT] edu

function DGOA_PlotHistPerClass(y, label_y, class_idx, class_labels)

n_classes = max(class_idx);

% Plot the distributions
nBins = 10;
figure;
ny = floor(sqrt(n_classes));
nx = ceil(n_classes / ny);
col = 'rgbcmyk';
for c = 1:n_classes
  subplot(ny, nx, c);
  hold on;
  yc = y(class_idx == c);
  nc = sum(class_idx == c);
  [counts, bins] = hist(yc, nBins);
  h = bar(bins, counts / nc, col(mod(c-1,7)+1));
  set(gca, 'YLim', [0 1]);
  set(get(h, 'Children'), 'FaceAlpha', 0.5);
  title(class_labels{c});
  xlabel(label_y);
end
