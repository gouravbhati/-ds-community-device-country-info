#import "Country.h"
#import<CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


@implementation Country

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
//RCT_REMAP_METHOD(getDeviceCountry,
//                 withResolver:(RCTPromiseResolveBlock)resolve
//                 withRejecter:(RCTPromiseRejectBlock)reject)
//{
//  NSNumber *result = @100;
//  resolve(result);
//}

//RCT_EXPORT_METHOD(getDeviceCountry:(NSString *)callback){
//
//    NSLocale *currentLocale = [NSLocale currentLocale];
//    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
//
////     return countryCode;
////    NSInteger eventId = 100;
//    callback(@[@(countryCode)]);
//}


RCT_REMAP_METHOD(getDeviceCountry,
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];

    resolve(countryCode);
}

//RCT_REMAP_METHOD(getDeviceCountry,
//                 withResolver:(RCTPromiseResolveBlock)resolve
//                 withRejecter:(RCTPromiseRejectBlock)reject)
//{
//
//    CTTelephonyNetworkInfo *network_Info = [CTTelephonyNetworkInfo new];
//    CTCarrier *carrier = network_Info.subscriberCellularProvider;
//
//    NSLog(@"country code is: %@", carrier.mobileCountryCode);
//
//    //will return the actual country code
//    NSLog(@"ISO country code is: %@", carrier.isoCountryCode);
//
//    NSLocale *currentLocale = [NSLocale currentLocale];
//    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
//
//    resolve(countryCode);
//}


//- (NSString*) getCountryCode {
//
//  NSLocale *currentLocale = [NSLocale currentLocale];
//  NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
//
//   return countryCode;
//}


@end
