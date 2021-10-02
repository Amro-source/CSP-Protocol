function ratio = calc_gear_ratio2(gear)
global Gear
 
switch gear
    case Gear.Reverse
        ratio = -1.2;
    case Gear.Neutral
        ratio = 0;
    case Gear.Low
        ratio = 1.2;
    case Gear.Med
        ratio = 2.3;
    case Gear.High
        ratio = 3.4;
    otherwise
        error(['Unknown enum value: ' num2str(gear)]);
end