function num_col = numberSeperateByBlank_fcn(str)
% ��ȡ�ַ������ɿո��������ֵ
% Get the value seperated by blans in strings

% str ԭʼ�ַ���
% num_col ��ȡ��������ֵ��������
% isBlank ����ǰһ���ַ��Ƿ�Ϊ�ո� 1 = Y��0 = N
% num_contour �ַ������м�����ֵ

    str=[str,' ']; % ���ַ�����β����һ���ո�ÿ����ֵǰ���пո����

    isBlank=1;
    num_contour=0;
    for i=1:numel(str)
        if (str(i)~=' ')&&isBlank==0
            isBlank=0;
        elseif (str(i)~=' ')&&isBlank==1
            num_contour=num_contour+1;
            isBlank=0;
        else
            isBlank=1;
        end
    end

    num_col=zeros(num_contour,1);
    num_change_number=1; %ת���ĵڼ�����ֵ
    start_mark=1; %��ֵ��ʼ���ַ�����ű��

    isBlank=1;
    for i=1:numel(str)
        if (str(i)~=' ')&&isBlank==0
            isBlank=0;
        elseif (str(i)~=' ')&&isBlank==1
            isBlank=0;
            start_mark=i;
        elseif (str(i)==' ')&&isBlank==0
            num_col(num_change_number)=str2double(str(start_mark:i));
            num_change_number=num_change_number+1;
            isBlank=1;
        else
            isBlank=1;
        end
    end