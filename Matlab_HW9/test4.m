%%
%�s����J�ɮ�
if exist('test_f4.txt','file')==0 %�ˬd��J�ɮ׬O�_�s�b
    disp('test_f4.txt not exist');
    filename = input('�д��ѥt�@�ӿ�J�ɮצW��:\n','s'); %��J�ɮפ��s�b�A��J�s����J�ɮצW��
    
    [fid] = fopen(filename); %�s���ɮפ���ƨ��ഫ
    number = input('��J���N0~6�ƥ�:\n');
    x = [0,0,0,0,0,0];
    c = textscan(fid,'%f %f %f %f %f %f');

    for i=1:number
        x(i) = round(c{i});
    end
    fclose(fid);
else %��l��J�ɮצs�b
    [fid] = fopen('test_f4.txt');
    number = input('��J���N0~6�ƥ�:\n');
    x = [0,0,0,0,0,0];
    c = textscan(fid,'%f %f %f %f %f %f');

    for i=1:number
        x(i) = round(c{i});
    end
    fclose(fid);
end
%%
%�إ߿�X�ɮ�
outputfile = input('�ۭq��X�ɮצW��:\n','s');
        if exist(outputfile, 'dir') == 0 
            [fid] = fopen(outputfile, 'w');  %% create a new test_f1.txt.
            fclose(fid);
            clear fid;
        end
%%
%�g�J�ɮ�
if exist(outputfile,'file')~=0
    answer = input('�O�_�л\�ɮ�:yes/no \n','s');
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
        filename = input('�д��ѥt�@�ӿ�X�ɮצW��: \n','s');
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