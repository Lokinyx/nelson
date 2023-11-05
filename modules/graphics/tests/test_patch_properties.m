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
names = properties(p);
REF = {'AlphaDataMapping'; ...       
'AmbientStrength'; ...         
'BackFaceLighting'; ...        
'CData'; ...                   
'CDataMapping'; ...            
'Children'; ...                
'DiffuseStrength'; ...         
'EdgeAlpha'; ...               
'EdgeColor'; ...               
'EdgeLighting'; ...            
'FaceAlpha'; ...               
'FaceColor'; ...               
'FaceLighting'; ...            
'Faces'; ...                   
'FaceVertexCData'; ...         
'LineStyle'; ...               
'LineWidth'; ...               
'Marker'; ...                  
'MarkerEdgeColor'; ...         
'MarkerFaceColor'; ...         
'MarkerSize'; ...              
'Parent'; ...                  
'SpecularColorReflectance'; ...
'SpecularExponent'; ...        
'SpecularStrength'; ...        
'Tag'; ...                     
'DisplayName'; ...             
'Type'; ...                    
'UserData'; ...                
'VertexNormals'; ...           
'Vertices'; ...                
'XData'; ...                   
'XDataMode'; ...               
'YData'; ...                   
'YDataMode'; ...               
'ZData'; ...                   
'Visible'};
assert_isequal(names, REF);
assert_isequal(p.Visible, 'on');
assert_isequal(p.XData, [0; 0; 1; 0]);
assert_isequal(p.YData, [1; 1; 1; 0]);
assert_isequal(p.ZData, [1; 1; 1; 1]);
assert_isequal(p.LineStyle, '-');
%=============================================================================
