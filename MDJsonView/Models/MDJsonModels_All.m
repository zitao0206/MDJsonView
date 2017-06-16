//
//  MDJsonModels_All.m
//  MDProject
//
//  Created by lizitao on 2017/6/14.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonBaseModel.h"
#import "MDJsonModel.h"
#import "UIColor+nvutils.h"
#import "MDJsonViewModel.h"
#import "MDJsonMappers.h"
#import "MDJsonLabelModel.h"
#import "MDJsonImageViewModel.h"

@implementation MDJsonBaseModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    return nil;
}

- (void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    
}

@end

@implementation MDJsonModel

+(instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    MDJsonModel *model = [MDJsonModel new];
    [model setModelWithDictionary:dictionaryValue];
    return model;
}

-(void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    self.type = [dictionaryValue objectForKey:@"type"];
    NSString *backgroundColorHex = [dictionaryValue objectForKey:@"backgroundColor"];
    if (backgroundColorHex.length) {
        self.backgroundColor = [UIColor nvColorWithHexString:backgroundColorHex];
    }
    self.y = [[dictionaryValue objectForKey:@"y"] doubleValue];
    self.x = [[dictionaryValue objectForKey:@"x"] doubleValue];
    self.height = [[dictionaryValue objectForKey:@"height"] doubleValue];
    self.width = [[dictionaryValue objectForKey:@"width"] doubleValue];
    if (isnan(self.x)) {
        self.x = 0;
    }
    if (isnan(self.y)) {
        self.y = 0;
    }
    if (isnan(self.height)) {
        self.height = 0;
    }
    if (isnan(self.width)) {
        self.width = 0;
    }
}

@end

@implementation MDJsonViewModel

+(instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    MDJsonViewModel *model = [MDJsonViewModel new];
    [model setModelWithDictionary:dictionaryValue];
    return model;
}

- (void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    [super setModelWithDictionary:dictionaryValue];
    NSArray *subViews = [dictionaryValue objectForKey:@"subViews"];
    NSMutableArray *subViewModels = [NSMutableArray array];
    for (NSDictionary *subView in subViews) {
        NSString *viewType = [subView objectForKey:@"type"];
        Class modelCls = NSClassFromString([[MDJsonMappers new] obtainViewByType:viewType]);
        MDJsonModel *model = [modelCls modelWithDictionary:subView];
        if (model) {
            [subViewModels addObject:model];
        }
    }
    self.subViews = subViewModels;
}

@end

@implementation MDJsonLabelContentModel

+(instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    MDJsonLabelContentModel *model = [MDJsonLabelContentModel new];
    [model setModelWithDictionary:dictionaryValue];
    return model;
}

- (void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    NSString *textColor = [dictionaryValue objectForKey:@"textColor"];
    if (textColor.length) {
        self.textColor = [UIColor nvColorWithHexString:textColor];
    }
    self.textSize = [[dictionaryValue objectForKey:@"textSize"] doubleValue];
    self.text = [dictionaryValue objectForKey:@"text"];
}

@end

@implementation MDJsonLabelModel

+(instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    MDJsonLabelModel *model = [MDJsonLabelModel new];
    [model setModelWithDictionary:dictionaryValue];
    return model;
}

-(void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    [super setModelWithDictionary:dictionaryValue];
    self.numberOfLines = [[dictionaryValue objectForKey:@"numberOfLines"] integerValue];
    self.lineSpacing = [[dictionaryValue objectForKey:@"lineSpacing"] doubleValue];
    NSArray *textList = [dictionaryValue objectForKey:@"textList"];
    NSMutableArray *subViewModels = [NSMutableArray array];
    for (NSDictionary *txt in textList) {
        MDJsonLabelContentModel *model = [MDJsonLabelContentModel modelWithDictionary:txt];
        if (model) {
            [subViewModels addObject:model];
        }
    }
    self.textList = subViewModels;
}

@end

@implementation MDJsonImageViewModel

+(instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue
{
    MDJsonImageViewModel *model = [MDJsonImageViewModel new];
    [model setModelWithDictionary:dictionaryValue];
    return model;
}

-(void)setModelWithDictionary:(NSDictionary *)dictionaryValue
{
    [super setModelWithDictionary:dictionaryValue];
    self.url = [dictionaryValue objectForKey:@"url"];
    self.localImageName = [dictionaryValue objectForKey:@"localImageName"];
}


@end
