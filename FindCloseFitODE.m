function [params, resid] = FindCloseFitODE(ydata, xdata, functionName, initialParams, tolerance)
    
    [t,y] = ode45(functionName, [xdata(1), xdata(length(xdata))], ydata(:,1), [], initialParams);
    p = zeros(height(ydata),length(xdata) + 1);
    resid = zeros(height(ydata),1); 
    for i = 1:height(ydata)
        p(i,:) = polyfit(xdata, ydata(i,:), length(xdata));
        err = zeros(length(t),1);
        for j=1:length(err)
            err(j) = polyval(p(1,:),t(j)) - y(i,j);
        end
        resid(i) = sum(err.^2);
    end
    
    
    while(~isempty(find(resid > tolerance)))
        for i = 1:length(resid)
            
        end
        [t,y] = ode45(functionName, [xdata(1), xdata(length(xdata))], ydata(:,1), [], params);
    end
    
    
    
end