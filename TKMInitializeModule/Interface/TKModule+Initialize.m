//
//  TKModule+Initialize.m
//  TKMInitializeModule
//
//  Created by Thief Toki on 2021/3/25.
//

#import "TKModule+Initialize.h"

#import "TKMInitializeAlertView.h"

#import <TKMRequest/TKMRequest.h>

@implementation TKModule (Initialize)

- (void)initializeWithEnvironment:(TKMEnvironmentType)environmentType {
    [[TKMEnvironmentInfoManager shared] registerWithEnvironmentType:environmentType];
    
    [[TKMRequest shared] registerBaseURL:[TKMEnvironmentInfoManager shared].baseURL
                          baseHeaderHook:^NSDictionary * _Nonnull{
        return @{
            @"osversion": [TKMDeviceInfoManager shared].OSVersion?:@""
        };
    } baseParamHook:^NSDictionary * _Nonnull{
        return @{
            @"token": [TKMAccountInfoManager shared].token?:@""
        };
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:[TKMInitializeAlertView new]];
}

@end
