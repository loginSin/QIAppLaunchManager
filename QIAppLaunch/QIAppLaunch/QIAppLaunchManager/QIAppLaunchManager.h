//
//  QIAppLaunchManager.h
//  QIAppLaunchManager
//
//  Created by loginSin on 16/3/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QIAppLaunchManager : NSObject
/**
 *  调用此方法，检测app是否是第一次安装或者刚刚进行过版本更新
 *  注：此方法最好在AppDelegate中的 application:didFinishLaunchingWithOptions: 方法中调用
 *
 *  @param block 如果app是安装或者版本更新之后的第一次打开就会触发block,可以在block中进行操作，来控制显示引导页面
 */
+ (void)isFirstLaunched:(void(^)())block;
@end
