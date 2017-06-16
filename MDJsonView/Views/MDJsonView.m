//
//  MDJsonView.m
//  MDProject
//
//  Created by lizitao on 2017/6/14.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonView.h"
#import "MDJsonViewModel.h"
#import "MDJsonLabelModel.h"
#import "MDJsonLabel.h"
#import "UIColor+nvutils.h"
#import "UIView+ResizeFrame.h"
#import "MDJsonImageView.h"

@interface MDJsonView ()
@property (nonatomic, strong) MDJsonViewModel *model;
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

- (void)setJsonString:(NSString *)jsonString
{
    if (![self validateData:jsonString]) {
        return;
    }
    _jsonString = jsonString;
    _model = [self.class modelWithJsonString:jsonString];
    [self creatJsonTopViewWithModel:_model];
}

- (BOOL)validateData:(NSString *)jsonString
{
    return [jsonString isKindOfClass:[NSString class]] || jsonString == nil;
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
        [self creatJsonSubViewsWith:model inView:self];
    }
}

- (void)creatJsonSubViewsWith:(MDJsonViewModel *)model inView:(UIView *)rootView
{
    for (MDJsonModel *subModel in model.subViews) {
        if ([subModel isKindOfClass:[MDJsonViewModel class]]) {
            MDJsonViewModel *viewModel = (MDJsonViewModel *)subModel;
            UIView *view = [UIView new];
            if (viewModel.backgroundColor) {
                view.backgroundColor = viewModel.backgroundColor;
            }
            view.frame = CGRectMake(viewModel.x, viewModel.y, viewModel.width, viewModel.height);
            [rootView addSubview:view];
            if ([viewModel.subViews count] > 0) {
                [self creatJsonSubViewsWith:(MDJsonViewModel *)subModel inView:view];
            }
        }
        if ([subModel isKindOfClass:[MDJsonLabelModel class]]) {
            MDJsonLabelModel *labelModel = (MDJsonLabelModel *)subModel;
            MDJsonLabel *label = [MDJsonLabel new];
            label.model = labelModel;
            label.frame = CGRectMake(labelModel.x, labelModel.y, label.width, label.height);
            [rootView addSubview:label];
        }
        if ([subModel isKindOfClass:[MDJsonImageViewModel class]]) {
            MDJsonImageViewModel *imageViewModel = (MDJsonImageViewModel *)subModel;
            MDJsonImageView *imageView = [MDJsonImageView new];
            imageView.model = imageViewModel;
            imageView.frame = CGRectMake(imageViewModel.x, imageViewModel.y, imageViewModel.width, imageViewModel.height);
            [rootView addSubview:imageView];
        }

    }
}


+ (MDJsonViewModel *)modelWithJsonString:(NSString *)jsonString
{
    NSDictionary *dic = [self.class JSONValue:jsonString];
    return [MDJsonViewModel modelWithDictionary:dic];
}

+ (id)JSONValue:(NSString *)s
{
    if (s.length == 0) return @{};
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:[s dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
    if (error)
    {
        NSLog(@"%@", error);
        return nil;
    }
    return obj;
}

@end
