//
//  MDJsonModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/14.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonBaseModel.h"

@interface MDJsonModel : MDJsonBaseModel
/** 类型*/
@property (nonatomic, copy) NSString *type;
/** x*/
@property (nonatomic, assign) double x;
/** y*/
@property (nonatomic, assign) double y;
/** 宽度*/
@property (nonatomic, assign) double width;
/** 高度*/
@property (nonatomic, assign) double height;
/** 背景颜色*/
@property (nonatomic, strong) UIColor *backgroundColor;

@end
