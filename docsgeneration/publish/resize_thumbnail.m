%==========================================================================
%
% resize_thumbnail  Resizes "docsgeneration/thumbnail/thumbnail.png" and 
% saves it to "docs/thumbnail_resized.png"
%
%   resize_thumbnail
%
% Author: Tamas Kis
% Last Update: 2022-07-06
%
%==========================================================================
function resize_thumbnail
    
    % reads in original thumbnail image
    A = imread('../thumbnail/thumbnail.png');
    
    % determines number of rows and columns of pixels
    numrows = size(A,1);
    numcols = size(A,2);
    
    % desired number of cols
    numcols_new = 360;
    
    % desired number of columns
    numrows_new = round((numcols_new/numcols)*numrows);
    
    % resized image
    B = imresize(A,[numrows_new,numcols_new]);
    
    % saves resized image to "docs" folder as "thumbnail_resized.png"
    imwrite(B,'../../docs/thumbnail_resized.png');
    
end