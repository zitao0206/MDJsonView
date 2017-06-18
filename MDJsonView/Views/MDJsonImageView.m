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
    NSString *url = @"";
    if(_model.url.length > 0) {
        url = _model.url;
    }
    if (_model.localImageName.length) {
        url = _model.localImageName;
    }
    if (_model.url.length > 0) {
        @weakify(self);
        [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            @strongify(self);
            if (image) {
                [self setImage:image];
            } else {
                [self setImage:[UIImage imageNamed:@"MDErrorPicFrame.png"]];
            }
            if (self.model.isNeedCallBack) {
                MDJsonNotificationResultModel *result = [self buildImageResultWith:image Url:imageURL Error:error];
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:result, @"imageView", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MDAsynchronousResourceData" object:nil userInfo:dic];
            }
        }];
    } else if (url.length > 0) {
        [self setImage:[UIImage imageNamed:url]];
    } else {
        [self setImage:[UIImage imageNamed:@"MDErrorPicFrame.png"]];
    }
    [self sizeToFit];
}

- (MDJsonNotificationResultModel *)buildImageResultWith:(UIImage *)image Url:(NSURL *)imageUrl Error:(NSError *)error
{
    MDJsonNotificationResultModel *model = [MDJsonNotificationResultModel new];
    model.imageURL = imageUrl;
    model.image = image;
    model.error = error;
    model.name = _model.url;
    return model;
}

@end
