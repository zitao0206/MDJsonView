//
//  MDJsonView.m
//  MDProject
//
//  Created by lizitao on 2017/6/14.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonView.h"
#import "MDJsonViewModel.h"
#import "MDJsonLabel.h"
#import "UIColor+nvutils.h"
#import "UIView+ResizeFrame.h"

@interface MDJsonView ()

@end

@implementation MDJsonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setModel:(MDJsonViewModel *)model
{
    _model = model;
    if (_model) {
        [self creatJsonTopViewWithModel:_model];
    }
}


- (void)creatJsonTopViewWithModel:(MDJsonViewModel *)model
{
    if (![model isKindOfClass:[MDJsonViewModel class]]) return;
    if (!model || ![model.type isEqualToString:@"view"]) {
        self.backgroundColor = [UIColor blackColor];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    } else {
        //背景色
        if (model.backgroundColor) {
            self.backgroundColor = model.backgroundColor;
        }
        self.frame = CGRectMake(model.x, model.y, model.width, model.height);
    }
}

@end
