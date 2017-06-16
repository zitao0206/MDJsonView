//
//  UIColor+nvutils.h
//  Pods
//
//  Created by xwd on 3/22/16.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (nvutils)

+ (UIColor *)nvColorWithHexString:(NSString *)hexString;

+ (UIColor *)nvColorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
+ (UIColor *)nvColorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(NSInteger)a;

@end

