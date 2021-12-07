search_str = {'to','favorite'};

for idx = 1:length(search_str)
    grep('test_f2.txt',search_str{idx});
end

function grep(filename,pattern)
    [fid] = fopen(filename, 'r');
    line_number=1;
    while ~feof(fid)
        line = fgetl(fid);
        matched = strfind(line, pattern);
        
        if ~isempty(matched)
            fprintf('%d: %s \n',line_number,line);
        end
        line_number=line_number+1;
    end
fclose(fid);
    
end