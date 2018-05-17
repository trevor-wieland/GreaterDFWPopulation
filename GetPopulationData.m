function [PopData, RangesNames] = GetPopulationData()
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
    Ranges = [ DallasRange, TarrantRange, CollinRange, RockwallRange, KaufmanRange, EllisRange, DentonRange, JohnsonRange, ParkerRange, WiseRange ];
    RangesNames = ["Dallas", "Collin", "Denton", "Tarrant", "Wise", "Parker", "Johnson", "Ellis", "Kaufman", "Rockwall"];
    Sheet = xlsread(filename, 1);
    PopData = [];
    for i = 1:length(Ranges)
        PopData = [PopData; Sheet(Ranges(i), 2:16)];
    end
    PopData = fliplr(PopData);
    
    PopData(find(isnan(PopData))) = 0;
    
end