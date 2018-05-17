function error =ExpError(p)
    [PopData, RangesNames] = GetPopulationData();
    years = 1850:10:1990;
    [t,y] = ode45(@ExpModel, years, PopData(:,1), [], p);
    value = (y - PopData').^2;
    error = sum(value);
end