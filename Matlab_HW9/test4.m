%%
%存取輸入檔案
if exist('test_f4.txt','file')==0 %檢查輸入檔案是否存在
    disp('test_f4.txt not exist');
    filename = input('請提供另一個輸入檔案名稱:\n','s'); %輸入檔案不存在，輸入新的輸入檔案名稱
    
    [fid] = fopen(filename); %存取檔案內資料並轉換
    number = input('輸入任意0~6數目:\n');
    x = [0,0,0,0,0,0];
    c = textscan(fid,'%f %f %f %f %f %f');

    for i=1:number
        x(i) = round(c{i});
    end
    fclose(fid);
else %原始輸入檔案存在
    [fid] = fopen('test_f4.txt');
    number = input('輸入任意0~6數目:\n');
    x = [0,0,0,0,0,0];
    c = textscan(fid,'%f %f %f %f %f %f');

    for i=1:number
        x(i) = round(c{i});
    end
    fclose(fid);
end
%%
%建立輸出檔案
outputfile = input('自訂輸出檔案名稱:\n','s');
        if exist(outputfile, 'dir') == 0 
            [fid] = fopen(outputfile, 'w');  %% create a new test_f1.txt.
            fclose(fid);
            clear fid;
        end
%%
%寫入檔案
if exist(outputfile,'file')~=0
    answer = input('是否覆蓋檔案:yes/no \n','s');
    if strcmp('yes',answer)==1
        [fid] = fopen(outputfile, 'w');
        STR = '';
        for i=1:number
            STR=sprintf('%s%d%s',STR,x(i),' ');
        end
        fwrite(fid, STR);
        fclose(fid);
    end
    
    if strcmp('no',answer)==1
        filename = input('請提供另一個輸出檔案名稱: \n','s');
        if exist(filename, 'dir') == 0 
            [fid] = fopen(filename, 'w');  %% create a new test_f1.txt.
            fclose(fid);
            clear fid;
        end
        [fid] = fopen(filename, 'w');
        STR = '';
        for i=1:number
            STR=sprintf('%s%d%s',STR,x(i),' ');
        end
        fwrite(fid, STR);
        fclose(fid);
    end
end