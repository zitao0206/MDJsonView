//
//  MDJsonLabel.h
//  MDProject
//
//  Created by lizitao on 2017/6/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDJsonLabelModel.h"
@class MDJsonLabelModel;
@class MDJsonLabelContentModel;

@interface MDJsonLabel : UILabel
@property (nonatomic, copy) NSString *jsonString;
@property (nonatomic, strong) MDJsonLabelModel *model;

@end
