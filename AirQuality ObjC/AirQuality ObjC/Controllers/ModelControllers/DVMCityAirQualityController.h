//
//  DVMCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Shean Bjoralt on 9/30/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityAirQuality.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCityAirQualityController : NSObject

- (NSArray *)fetchSupportedCountries;
- (NSArray *)fetchSupportedStatesInCountry:(NSString *)country;
- (NSArray *)fetchSupportedCitiesInState:(NSString *)state;
- (CityAirQuality *)fetchDataForCity:(NSString *)city
                               state:(NSString *)state
                             country:(NSString *)country;

@end

NS_ASSUME_NONNULL_END
