//
//  DVMWeather.m
//  AirQuality ObjC
//
//  Created by Shean Bjoralt on 9/30/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "DVMWeather.h"

@implementation DVMWeather

- (instancetype)initWithWeatherInfo:(NSInteger)temperature
                           humidity:(NSInteger)humidity
                          windspeed:(NSInteger)windspeed
{
    self = [super init];
    if (self) {
        _temperature = temperature;
        _humidity = humidity;
        _windspeed = windspeed;
    }
    return self;
}

@end

@implementation DVMWeather (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSInteger weatherTemperature =  [@"" integerValue];
    NSInteger weatherHumidity =     [@"" integerValue];
    NSInteger weatherWindspeed =    [@""integerValue];
    
    return [self initWithWeatherInfo:weatherTemperature humidity:weatherHumidity windspeed:weatherWindspeed];
}

@end
