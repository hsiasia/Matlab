key_str = 'Name Nation Grade Score Age PASS_EXAM';
key_lst = strsplit(key_str,' ');

[fid] = fopen('test_f3.txt');
c = textscan(fid,'%s %s %s %f %d %s');
for i=1:6
     fprintf('%s: \n',key_lst{i});
     disp(c{i});
     disp('----------------');
end
fclose(fid);