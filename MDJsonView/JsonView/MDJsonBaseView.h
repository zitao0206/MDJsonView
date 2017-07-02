//
//  MDJsonBaseView.h
//  MDJsonView
//
//  Created by lizitao on 2017/6/16.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDJsonNotificationResultModel.h"

typedef void (^resultBlock)(MDJsonNotificationResultModel *);

@interface MDJsonBaseView : UIView
@property (nonatomic, copy) NSString *jsonString;

- (void)obtainResult:(resultBlock)result;

@end
