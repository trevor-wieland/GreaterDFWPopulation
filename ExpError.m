function error =ExpError(p, data)
    years = 1850:10:1990;
    [t,y] = ode45(@ExpModel, years, data(1), [], p);
    value = (y - data').^2;
    error = sum(value);
end