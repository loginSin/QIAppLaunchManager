//
//  QIAppUpdateManager.m
//  QITableViewTest
//
//  Created by loginSin; on 16/3/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import "QIAppLaunchManager.h"

@implementation QIAppLaunchManager

+ (void)isFirstLaunched:(void(^)())block {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunched"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        block();
        return;
    }

    NSString *currentVersion = [self getCurrentVersion];
    if (![[[NSUserDefaults standardUserDefaults] stringForKey:@"clientVersion"] isEqualToString:currentVersion]){
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"clientVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        block();
        return;
    }
}
//获取当前版本号
+ (NSString *)getCurrentVersion {
    //比如当前版本是1.0.3
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionName = [infoDict objectForKey:@"CFBundleShortVersionString"];//1.0
    NSString *bundleName = [infoDict objectForKey:@"CFBundleVersion"];//3
    return [NSString stringWithFormat:@"%@%.@",versionName,bundleName];//1.0.3
}
@end
