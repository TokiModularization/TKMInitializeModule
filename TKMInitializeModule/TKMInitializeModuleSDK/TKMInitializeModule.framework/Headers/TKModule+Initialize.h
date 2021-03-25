//
//  TKModule+Initialize.h
//  TKMInitializeModule
//
//  Created by Thief Toki on 2021/3/25.
//

#import <TKModule/TKModule.h>

#import <TKMInfoManager/TKMInfoManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKModule (Initialize)

- (void)initializeWithEnvironment:(TKMEnvironmentType)environmentType;

@end

NS_ASSUME_NONNULL_END
