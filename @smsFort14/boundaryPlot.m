function boundaryPlot(obj,h_axe)
    set(h_axe, 'NextPlot', 'add')
    % ���ƿ��߽�
    for i = 1:length(obj.OpenBoundaryPositionXY_cell)
        plot(h_axe, obj.OpenBoundaryPositionXY_cell{i}(:,1),...
            obj.OpenBoundaryPositionXY_cell{i}(:,2),'b')
    end
    % ����½�ر߽�
    for i = 1:length(obj.LandBoundaryPositionXY_cell)
        plot(h_axe, obj.LandBoundaryPositionXY_cell{i}(:,1),...
            obj.LandBoundaryPositionXY_cell{i}(:,2),'k')
    end
end