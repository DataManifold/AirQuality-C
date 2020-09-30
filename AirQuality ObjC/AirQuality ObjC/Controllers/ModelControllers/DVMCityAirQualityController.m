//
//  DVMCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Shean Bjoralt on 9/30/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "DVMCityAirQualityController.h"
#import "CityAirQuality.h"

@implementation DVMCityAirQualityController

static NSString * const baseURLString = @"https://api.airvisual.com/";
static NSString * const versionComponent = @"v2";
static NSString * const countryComponent = @"coutries";
static NSString * const stateComponent = @"states";
static NSString * const cityComponent = @"cities";
static NSString * const cityDetailComponent = @"city";
//static NSString * const apiKey = @"";

+ (void)fetchSupportedCounties:(void (^) (NSArray<NSString *> *))completion
{
    NSString *apiKey = [DVMCityAirQualityController apiKey];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL *countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
    NSURLQueryItem *keyQueryItem = [NSURLQueryItem queryItemWithName:@"key"
                                                               value:apiKey];
    NSURLComponents *components = [NSURLComponents componentsWithURL:countryURL
                                             resolvingAgainstBaseURL:true];
    components.queryItems = @[keyQueryItem];
    NSURL *finalURL = components.URL;
    
    NSLog(@"%s[%d]: %@\n---\n",__FUNCTION__,__LINE__, finalURL);
    
    NSMutableArray *countries = [NSMutableArray new];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@\n%@",error, error.localizedDescription);
        }
        
        if (!data) {
            NSLog(@"There appears to be no data: %@\n%@",error, error.localizedDescription);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *dataArray = topLevelDictionary[@"data"];
        for (NSDictionary *dataDictionary in topLevelDictionary)
        {
            CityAirQuality *dictionary = [[CityAirQuality alloc] initWithStrng:dataDictionary];
            [dataArray addObject:dictionary];
        }
    }] resume];
    

    return @[];
}

+ (NSArray *)fetchSupportedStatesInCountry:(NSString *)country
{
    return @[];
}

+ (NSArray *)fetchSupportedCitiesInState:(NSString *)state
{
    return @[];
}

+ (CityAirQuality *)fetchDataForCity:(NSString *)city
                               state:(NSString *)state
                             country:(NSString *)country
{
    return [CityAirQuality new];
}

+ (NSString *)apiKey
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AirQualityAPI" ofType: @"plist"];
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *apiKey = plistDictionary[@"API_KEY"];
    return apiKey;
}

@end
