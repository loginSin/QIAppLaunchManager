//
//  QIAppLaunchManager.m
//  QIAppLaunchManager
//
//  Created by loginSin; on 16/3/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import "QIAppLaunchManager.h"

@implementation QIAppLaunchManager

+ (void)isFirstLaunched:(void(^)())block {
    NSString *currentVersion = [self getCurrentVersion];
    
    //如果是安装之后第一次打开
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunched"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"clientVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        block();
        return;
    }

    //如果是版本更新之后第一次打开
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
