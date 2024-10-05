function filtre()

file_path = 'FILTRE_RLC.pptx';  % Replace with the actual path to your PowerPoint file

try
    system(['start "" "', file_path, '"']);
catch
    fprintf('Error: Unable to open the PowerPoint file.\n');
end