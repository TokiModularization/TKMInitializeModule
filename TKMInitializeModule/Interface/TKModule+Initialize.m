//
//  TKModule+Initialize.m
//  TKMInitializeModule
//
//  Created by Thief Toki on 2021/3/25.
//

#import "TKModule+Initialize.h"

#import "TKMInitializeStartView.h"

#import <Masonry/Masonry.h>
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
    
    TKMInitializeStartView *startView = [[TKMInitializeStartView alloc] init];
    [[UIApplication sharedApplication].keyWindow addSubview:startView];
    [startView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

@end
