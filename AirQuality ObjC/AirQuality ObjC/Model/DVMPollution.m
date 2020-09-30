//
//  DVMPollution.m
//  AirQuality ObjC
//
//  Created by Shean Bjoralt on 9/30/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "DVMPollution.h"

@implementation DVMPollution

- (instancetype)initWithAQInteger:(NSInteger)aqi
{
    self = [super init];
    if (self) {
        _airQualityIndex = aqi;
    }
    return self;
}

@end

@implementation DVMPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSInteger aqiValue = [@"" integerValue];
    
    return [self initWithAQInteger:aqiValue];
}

@end
