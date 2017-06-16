//
//  UIColor+nvutils.m
//  Pods
//
//  Created by xwd on 3/22/16.
//
//

#import "UIColor+nvutils.h"

@implementation UIColor (nvutils)

+ (UIColor *)nvColorWithHexString:(NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString]; //去掉前后空格换行符
    
    // String should be 6 or 8 characters
    //    if ([cString length] < 6) return [UIColor whiteColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if (cString.length == 3) {
        NSMutableString *rString = [[NSMutableString alloc] initWithCapacity:6];
        [rString appendFormat:@"%C%C%C%C%C%C", [cString characterAtIndex:0], [cString characterAtIndex:0], [cString characterAtIndex:1], [cString characterAtIndex:1], [cString characterAtIndex:2], [cString characterAtIndex:2]];
        cString = [NSString stringWithString:rString];
    }
    else if (cString.length == 4) {
        NSMutableString *rString = [[NSMutableString alloc] initWithCapacity:8];
        [rString appendFormat:@"%C%C%C%C%C%C%C%C", [cString characterAtIndex:0], [cString characterAtIndex:0], [cString characterAtIndex:1], [cString characterAtIndex:1], [cString characterAtIndex:2], [cString characterAtIndex:2], [cString characterAtIndex:3], [cString characterAtIndex:3]];
        cString = [NSString stringWithString:rString];
    }
    
    if ([cString length] != 6 && [cString length] != 8) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *aString = @"ff";
    if ([cString length] == 8) {
        aString = [cString substringWithRange:range];
        range.location += 2;
    }
    NSString *rString = [cString substringWithRange:range];
    range.location += 2;
    NSString *gString = [cString substringWithRange:range];
    range.location += 2;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned r, g, b, a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  //扫描16进制到int
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    
    return [UIColor nvColorWithIntRed:r green:g blue:b alpha:a];
}

+ (UIColor *)nvColorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b {
    return [UIColor nvColorWithIntRed:r green:g blue:b alpha:255];
}

+ (UIColor *)nvColorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(NSInteger)a {
    return [UIColor colorWithRed:((CGFloat)r / 255.f) green:((CGFloat)g / 255.f) blue:((CGFloat)b / 255.f) alpha:((CGFloat)a / 255.f)];
}

@end
