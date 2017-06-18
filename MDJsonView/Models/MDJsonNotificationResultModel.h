//
//  MDJsonNotificationResultModel.h
//  MDJsonView
//
//  Created by lizitao on 2017/6/16.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MDJsonNotificationResultModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSError *error;

@end
