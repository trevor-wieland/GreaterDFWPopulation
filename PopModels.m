clf

[PopData, RangesNames] = GetPopulationData();

for i = 1:length(Ranges)
    figure(i)
    plot(years, PopData(i,:), 'bx');
    hold on
    xlabel('Years')
    ylabel('Population')
    title(RangesNames(i) + ' County Population over time')
end

Models = ["Exponential", "Super-Exponential", "Gompertz", "Logistic"];
for i = 1:length(Models)
    if i == 1
        guess = zeros(1,19);
        params = lsqcurvefit(@ExpModel, guess, years, PopData);
        [t,y] = ode45(@ExpModel, [1850, 2030], [1950], [], params);
        
        for j = 1:length(Ranges)
            figure(10 + j)
            plot(t, y(j), '-r');
            hold on
            plot(years, PopData(j,:), 'bx');
            xlabel('Years')
            ylabel('Population')
            title(RangesNames(j) + ' Modeled Population over time')
        end
    end
    
end




