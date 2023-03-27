%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <--ADV-CLI MODE-->
%=============================================================================
figure();
p = patch();
%=============================================================================
figure();
props.FaceColor = 'red';
props.XData = [0 1 1 0];
props.YData = [0 0 1 1];
p = patch(props);
%=============================================================================
figure();
x2 = [2 5; 2 5; 8 8];
y2 = [4 0; 8 2; 4 0];
p = patch(x2, y2, [0 1 0]);
%=============================================================================
figure();
t1 = (1/16:1/8:1)' * 2*pi;
t2 = ((1/16:1/8:1)' + 1/32) * 2*pi;
x1 = sin (t1) - 0.8;
y1 = cos (t1);
x2 = sin (t2) + 0.8;
y2 = cos (t2);
p = patch ([x1,x2], [y1,y2], [1 0  0], 'FaceColor', [0 1 0]);
%=============================================================================
figure();
hold on
x = [0 1 1 0];
y = [0 0 1 1];
p1 = patch(x,y, 'blue');
x2 = [2 5; 2 5; 8 8];
y2 = [4 0; 8 2; 4 0];
p2 = patch(x2,y2, 'green');
hold off
%=============================================================================
figure();
t = 0:pi/5:2*pi;
p = patch(sin(t),cos(t),'y');
axis equal
%=============================================================================
figure();
v = [0 0; 1 0; 1 1; 0 1];
f = [1 2 3 4];
p = patch('Faces',f,'Vertices',v);
%=============================================================================
figure();
x = [ 0 1 0 1]';
y = [ 0 0 1 1]';
c = [ 1 1 1 ];
p = patch(x,y,c);
axis equal
view(3)
%=============================================================================
figure();
t1 = (1/16:1/8:1)' * 2*pi;
t2 = ((1/16:1/16:1)' + 1/32) * 2*pi;
x1 = sin (t1) - 0.8;
y1 = cos (t1);
x2 = sin (t2) + 0.8;
y2 = cos (t2);
p =patch ([[x1;NaN(8,1)],x2], [[y1;NaN(8,1)],y2], 'r');
%=============================================================================
figure();
x = [2 5; 2 5; 8 8];
y = [4 0; 8 2; 4 0];
c = [0; 1];
p = patch(x,y,c);
%=============================================================================
figure();
colormap (jet (64));
x = [ 0 0; 1 1; 1 0 ];
y = [ 0 0; 0 1; 1 1 ];
p = patch (x, y, [32 1]);
%=============================================================================
