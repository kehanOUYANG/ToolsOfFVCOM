function num = getNumInString_fcn(str,directionStr)
    % �ַ�������ֵɸѡ
    % directionStr ��ʾɸѡ����'front'ѡȡ�ַ����׵���ֵ��'back'ѡȡ�ַ���β����ֵ

    switch directionStr
        case 'front'
            for j=1:length(str)
                if abs(str(j))>57||abs(str(j))<48
                    str(j+1:end)=[];    % ȥ������֮����ַ�
                    break
                end
            end
        case 'back'
            for j=length(str):-1:1
                if abs(str(j))>57||abs(str(j))<48
                    str(1:j)=[];    % ȥ������֮����ַ�
                    break
                end
            end
    end
    num = str2double(str);