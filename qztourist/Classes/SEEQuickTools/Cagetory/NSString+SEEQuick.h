//
//  NSString+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SEEQuick)
///  返回一个字符串在指定宽度和字体大小下的高度
///
///  @param width  宽度
///  @param size   字体大小
///  @param string 字符串
+ (CGFloat)see_stringHeightWithWidth:(CGFloat)width fontSize:(CGFloat)size string:(NSString *)string;

///  返回当前字符串对象在指定宽度和字体大小下的高度
///
///  @param width  宽度
///  @param size   字体大小
- (CGFloat)see_heightWithWidth:(CGFloat)width fontSize:(CGFloat)size;

///  返回当前字符串对象在指定高度和字体大小下的宽度
///
///  @param height  高度
///  @param size   字体大小
- (CGFloat)see_widthWithHeight:(CGFloat)height fontSize:(CGFloat)size;

///  返回一个字符串在指定高度和字体大小下的高度
///
///  @param height  高度
///  @param size   字体大小
///  @param string 字符串
+ (CGFloat)see_stringWidthWithHeight:(CGFloat)height fontSize:(CGFloat)size string:(NSString *)string;

+ (NSString *)see_cachePathForURL:(NSString *)url;
@end
