/* Copyright Airship and Contributors */

#import "AirshipInitializer.h"

@import AirshipObjectiveC;

// Replace with your app's config
static NSString * const kAppKey = @"YOUR_APP_KEY";
static NSString * const kAppSecret = @"YOUR_APP_SECRET";

@implementation AirshipInitializer

+ (void)initializeAirship {
    UAConfig *cfg = [UAConfig defaultConfigWithError: nil];
    
    cfg.developmentLogLevel = UAAirshipLogLevelVerbose;
    cfg.productionLogLevel = UAAirshipLogLevelVerbose;

    cfg.defaultAppKey = kAppKey;
    cfg.defaultAppSecret = kAppSecret;

    NSError *takeOffError = nil;
    [UAirship takeOff:cfg error: &takeOffError];
    
    if (takeOffError) {
        NSLog(@"Airship takeOff failed: %@", takeOffError.localizedDescription);
        NSAssert(NO, @"Airship takeOff failed: %@", takeOffError.localizedDescription);
    }
}

@end
