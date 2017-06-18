//
//  MDJsonNotificationManager.m
//  MDJsonView
//
//  Created by lizitao on 2017/6/16.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonNotificationManager.h"
#import "MDJsonNotificationResultModel.h"

@implementation MDJsonNotificationManager

- (instancetype)init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"MDAsynchronousResourceData" object:nil];
    }
    return self;
}

- (void)handleNotification:(NSNotification *)noti
{
    id obj = noti.userInfo[@"imageView"];
    if([obj isKindOfClass:[MDJsonNotificationResultModel class]]) {
        self.result(obj);
    }
}

@end
