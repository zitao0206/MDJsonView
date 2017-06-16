//
//  MDJsonLabelModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonModel.h"

@interface MDJsonLabelContentModel : NSObject
/**字体颜色*/
@property(nonatomic, strong) UIColor *textColor;
/**字体大小*/
@property(nonatomic, assign) double textSize; // double
/**文字*/
@property(nonatomic, copy) NSString *text;

@end

@interface MDJsonLabelModel : MDJsonModel
@property(nonatomic, assign) NSInteger numberOfLines;
@property(nonatomic, assign) double lineSpacing;
/** label中的文字*/
@property(nonatomic, strong) NSArray <MDJsonLabelContentModel *> *textList;

@end
