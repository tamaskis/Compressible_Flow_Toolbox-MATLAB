%==========================================================================
%
% publish_html  Publishes documentation (written in .m files) to HTML
% files, and copies necessary images for documentation to the folders
% containing the HTML documentation.
%
%   publish_html(code_folders,mfiles,imagefiles,delete_docs)
%
% Author: Tamas Kis
% Last Update: 2022-07-06
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   abbrev      - (char) abbreviation for toolbox
%   mfiles      - (array of strings) stores specific .m files to publish;
%                 if input as an empty array, all .m files in 
%                 "docsgeneration/scripts" are published
%   imagefiles  - (array of strings) stores specific images to publish; if
%                 input as an empty array, all images in 
%                 "docsgeneration/images" are published
%   delete_docs - (1×1 logical) true if contents of "docs" and 
%                 "toolbox/doc/html" folders hould be deleted, false 
%                 otherwise
%
%==========================================================================
function publish_html(abbrev,mfiles,imagefiles,delete_docs)
    
    % ------------------------------
    % Sets up directories/filepaths.
    % ------------------------------
    
    % creates "docs" if it does not exist
    if exist("../../docs",'dir') == 0
        mkdir("../../docs");
    end
    
    % deletes contents of "docs" folder if specified
    if delete_docs
        docs = dir("../../docs");
        for k = 1:length(docs)
            delete("../../docs/"+docs(k).name)
        end
        clc;
    end
    
    % deletes contents of "toolbox/doc/html_abbrev" folder if specified
    if delete_docs
        docs = dir("../../toolbox/doc/html_"+abbrev);
        for k = 1:length(docs)
            delete("../../toolbox/doc/html_/"+abbrev+docs(k).name)
        end
        clc;
    end
    
    % adds path to toolbox folder
    addpath(genpath('../../toolbox'));
    
    % ----------------
    % Thumbnail image.
    % ----------------
    
    % resizes "docsgeneration/thumbnail/thumbnail.png" and saves it to
    % "docs/thumbnail_resized.png"
    resize_thumbnail;
    
    % ----------------------------------------------
    % Other images needed for toolbox documentation.
    % ----------------------------------------------
    
    % moves to "docsgeneration/images" folder (folder storing all images)
    cd("../images/");
    
    % creates list of images to publish (either a list of image file names
    % specified by the user, or if the user didn't specify anything, then
    % all .png, .jpg, .svg, .eps, .pbm, .pdf, and .bmp files in the
    % "docimages" folder are included)
    if isempty(imagefiles)
        extensions = ["png","jpg","svg","eps","pbm","pdf","bmp"];
        imagefiles = "";
        for i = 1:length(extensions)
            imagefiles_struct = dir(fullfile(pwd,"*."+extensions(i)));
            for j = 1:length(imagefiles_struct)
                imagefiles = [imagefiles;imagefiles_struct(j).name];
            end
        end
        imagefiles = imagefiles(2:end);
    end
    
    % copies images to "docs"
    for i = 1:length(imagefiles)
        copyfile(imagefiles(i),"../../docs/"+imagefiles(i));
    end
    
    % ----------------------
    % Toolbox documentation.
    % ----------------------
    
    % moves to "docsgeneration/scripts" folder (folder storing all .m file
    % documentation)
    cd("../scripts/");
    
    % creates list of .m files to publish (either a list of .m files
    % specified by the user, or if the user didn't specify anything then
    % all .m files in "docsgeneration/scripts" are included)
    if isempty(mfiles)
        mfiles_struct = dir(fullfile(pwd,'*.m'));
        mfiles = strings(length(mfiles_struct),1);
        for i = 1:length(mfiles)
            mfiles(i) = mfiles_struct(i).name;
        end
    end
    
    % publishes documentation, moving html files from "html" folder in 
    % "docsgeneration/scripts" to "docs" folder
    for i = 1:length(mfiles)
        fprintf("Publishing "+extractBetween(mfiles(i),1,...
        strlength(mfiles(i))-2)+".html\n");
        publish(mfiles(i),'html');
        movefile("html/*","../../docs/");
    end
    
    % removes "html" folder from "docsgeneration/scripts" folder
    rmdir("html");
    
    % returns to "docsgeneration/publish" folder
    cd("../publish/");
    
    % copies files from "docs" folder to "toolbox/doc/html_abbrev"
    copyfile("../../docs","../../toolbox/doc/html_"+abbrev);
    
    % ------------------------
    % Technical documentation.
    % ------------------------
    
    % copies technical documentation PDF file from "Technical 
    % Documentation" folder to "toolbox/doc"
    copyfile('../../Technical Documentation','../../toolbox/doc');
    
end