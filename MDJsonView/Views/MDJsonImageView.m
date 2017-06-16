//
//  MDJsonImageView.m
//  MDProject
//
//  Created by lizitao on 2017/6/15.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonImageView.h"
#import "UIImageView+WebCache.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACEXTScope.h"

@implementation MDJsonImageView

- (void)setModel:(MDJsonImageViewModel *)model
{
    _model = model;
    if (!_model) return;
    if (_model.url.length > 0) {
        [self sd_setImageWithURL:[NSURL URLWithString:_model.url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                [self setImage:image];
            } else {
                [self setImage:[UIImage imageNamed:@"MDErrorPicFrame.png"]];
            }
        }];
    } else if (_model.localImageName.length > 0) {
        [self setImage:[UIImage imageNamed:_model.localImageName]];
    } else {
        [self setImage:[UIImage imageNamed:@"MDErrorPicFrame.png"]];
    }
    [self sizeToFit];
}

@end
