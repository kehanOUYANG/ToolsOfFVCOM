classdef smsFort14 < handle
    % ��ȡ fort.14 ������Ϣ
    properties(SetAccess = private)
        pointNum                            % �ڵ����
        elementNum                          % ��Ԫ����
        PointPositionXY                     % xy���꣬double[ ?x2]
        PointDepth                          % ˮ����ֵ��double[ ?x1 ]
        ElementComponent                    % ���ÿ����Ԫ�ڵ���ţ�double[ ?x3 ]
        OpenBoundarySerial_cell             % ���߽�ڵ���ţ�double[ ?x1]
        LandBoundarySerial_cell             % ½�߽�ڵ���ţ�double[ ?x1]
        OpenBoundaryPositionXY_cell         % ���߽����꣬double[ ?x2]
        LandBoundaryPositionXY_cell         % ½�߽����꣬double[ ?x2]
    end
    
    properties(SetAccess = private, GetAccess = private)
        openBoundaryNum
        landBoundaryNum
%         OpenBoundarySerial_cell
%         LandBoundarySerial_cell
    end
    
    methods
        function obj = smsFort14(filename)
            import FVCOM.smsFort14
            global fig
            
            fig = fopen(filename,'r');
            %try
            fgets(fig);
            str = fgets(fig);
            s = smsFort14.numberSeperateByBlank_fcn(str);
            obj.elementNum = s(1);
            obj.pointNum = s(2);
            %�õ�fort.14�е�ĸ���
            point_data=fscanf(fig,'%d %f %f %f\n',[4,obj.pointNum]);
            point_data=point_data';

            obj.PointPositionXY=point_data(:,[2,3]);
            obj.PointDepth=point_data(:,4);
            %�õ����нڵ���Ϣ
            ele_data = fscanf(fig,'%d %d %d %d %d\n',[5,obj.elementNum]);
            ele_data=ele_data';
            obj.ElementComponent = ele_data(:,[3,4,5]);
            %�õ����е�Ԫ��Ϣ
            open_boundary_str=fgets(fig);
            % fgetl(fig);
            % ��ÿ��߽�������
            obj.openBoundaryNum = smsFort14.getNumInString_fcn(open_boundary_str,'front');
            % obj.openBoundaryNum = openBoundaryNum;
            obj.OpenBoundarySerial_cell = cell(obj.openBoundaryNum,1);
            obj.OpenBoundaryPositionXY_cell = cell(obj.openBoundaryNum,1);
            fgets(fig); 
            % ������п��߽�Ľڵ����������磺
            % '91 = Total number of open boundary nodes'

            obj.OpenBoundarySerial_cell = smsFort14.readFort14Boundary_fcn(obj.openBoundaryNum);


            land_boundary_str=fgets(fig);
            % ���·�߽�������������
            % '6 = Number of land boundaries'
            obj.landBoundaryNum = smsFort14.getNumInString_fcn(land_boundary_str,'front'); % ½�߽�ĸ���
            % obj.landBoundaryNum = landBoundaryNum;
            fgets(fig);         % �������½�߽�Ľڵ�����
            obj.LandBoundarySerial_cell = smsFort14.readFort14Boundary_fcn(obj.landBoundaryNum);
            obj.LandBoundaryPositionXY_cell = cell(obj.landBoundaryNum,1);
            fclose(fig);
            
            for i = 1:obj.openBoundaryNum
                obj.OpenBoundaryPositionXY_cell{i} = point_data(obj.OpenBoundarySerial_cell{i},[2,3]);
            end
            for i = 1:obj.landBoundaryNum
                obj.LandBoundaryPositionXY_cell{i} = point_data(obj.LandBoundarySerial_cell{i},[2,3]);
            end
        end
        
        % plot boundaries on spicific axes
        boundaryPlot(obj,h_axe)
        
%         % judge point inside or outside
%         isIn = isInside(obj, boundary, position)
    end
    methods(Static)
        num_col = numberSeperateByBlank_fcn(str)
        % ��ȡ�ַ������ɿո��������ֵ
        % Get the value seperated by blans in strings
        
        num = getNumInString_fcn(str,directionStr)
        % �ַ�������ֵɸѡ
        % directionStr ��ʾɸѡ����'front'ѡȡ�ַ����׵���ֵ��'back'ѡȡ�ַ���β����ֵ
        
        BoundarySerial_cell = readFort14Boundary_fcn(BoundaryNum)
        % ��ȡ fort.14 �߽���Ϣ����ʽΪ��
    end
end