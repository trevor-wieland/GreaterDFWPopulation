clf
filename = 'CountyPop.xls';
DallasRange = 3805;
CollinRange = 3791;
DentonRange = 3810;
TarrantRange = 3971;
WiseRange = 4000;
ParkerRange = 3935;
JohnsonRange = 3877;
EllisRange = 3819;
KaufmanRange = 3880;
RockwallRange = 3950;

RangesNames = ["Dallas", "Collin", "Denton", "Tarrant", "Wise", "Parker", "Johnson", "Ellis", "Kaufman", "Rockwall"];
Ranges = [ DallasRange, CollinRange, DentonRange, TarrantRange, WiseRange, ParkerRange, JohnsonRange, EllisRange, KaufmanRange, RockwallRange];
Sheet = xlsread(filename, 1);
PopData = [];
years = 1850:10:1990;
for i = 1:length(Ranges)
    PopData = [PopData; Sheet(Ranges(i), 2:16)];
end
PopData = fliplr(PopData);

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
        guess = zeros(19);
        [params, error] = fminsearch(@(p) ExpError(p, PopData), guess);
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




