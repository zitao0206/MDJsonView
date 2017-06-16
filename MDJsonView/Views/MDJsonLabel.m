//
//  MDJsonLabel.m
//  MDProject
//
//  Created by lizitao on 2017/6/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonLabel.h"
#import "UIColor+nvutils.h"
#import "UIView+ResizeFrame.h"

@interface MDJsonLabel ()

@end

@implementation MDJsonLabel

- (void)setJsonString:(NSString *)jsonString
{
    if (![self validateData:jsonString]) {
        return;
    }
    _jsonString = jsonString;
     NSDictionary *dic = [self.class JSONValue:jsonString];
    _model = [MDJsonLabelModel modelWithDictionary:dic];
    
    if (!_model) {
        self.text = jsonString;
    } else {
        self.attributedText = [self obtainContentStringWithModel:_model];
        [self obtainJsonLabelInfoWithModel:_model];
    }
}

- (void)setModel:(MDJsonLabelModel *)model
{
    _model = model;
    if (_model) {
        self.attributedText = [self obtainContentStringWithModel:_model];
        [self obtainJsonLabelInfoWithModel:_model];
    }
}

- (BOOL)validateData:(NSString *)jsonString
{
    return [jsonString isKindOfClass:[NSString class]] || jsonString == nil;
}

- (void)obtainJsonLabelInfoWithModel:(MDJsonLabelModel *)model
{
    if (_model.x > 0) {
        self.top = _model.y;
    }
    if (_model.y > 0) {
        self.left = _model.x;
    }
    if (_model.width > 0) {
        self.width = _model.width;
        [self sizeToFit];
    } else if (_model.height > 0) {
        self.height = _model.height;
        [self sizeToFit];
    } else {
        self.width = _model.width;
        self.height = _model.height;
    }
    //背景色
    if (_model.backgroundColor) {
        self.backgroundColor = _model.backgroundColor;
    }
}

- (NSMutableAttributedString *)obtainContentStringWithModel:(MDJsonLabelModel *)model
{
    NSMutableAttributedString *allAttributedString = [[NSMutableAttributedString alloc] init];
    if (!model) return allAttributedString;

    for (MDJsonLabelContentModel *textModel in model.textList) {
        if (textModel.text.length > 0) {
            NSMutableAttributedString *fragmentAttributedString = [[NSMutableAttributedString alloc] initWithString:textModel.text];
            UIFont *jsonFont = [self.class getFontWithModel:textModel];
            if (jsonFont) {
                [fragmentAttributedString addAttribute:NSFontAttributeName value:jsonFont range:NSMakeRange(0, textModel.text.length)];
            }
            //字体颜色
            if (textModel.textColor) {
                [fragmentAttributedString addAttribute:NSForegroundColorAttributeName value:textModel.textColor range:NSMakeRange(0, textModel.text.length)];
            };
            [allAttributedString appendAttributedString:fragmentAttributedString];
        }
    }
    //lineSpace
    if (model.lineSpacing > 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:model.lineSpacing];
        [allAttributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, allAttributedString.length)];
    }
    
    return allAttributedString;
}

+ (UIFont *)getFontWithModel:(MDJsonLabelContentModel *)model
{
    UIFont *currentFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    //字体大小
    CGFloat fontSize = model.textSize;
    if (fabs(fontSize - 0) <= 0.5) {
        fontSize = currentFont.pointSize;
    }
    UIFont *jsonFont = [UIFont fontWithName:currentFont.fontName size:fontSize];
    return jsonFont;
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

- (NSString *)JSONRepresentation
{
    if (![NSJSONSerialization isValidJSONObject:self]) return @"{}";
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingAllowFragments | NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
