//
//  NSString+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "NSString+SEEQuick.h"

@implementation NSString (SEEQuick)

+ (CGFloat)see_stringHeightWithWidth:(CGFloat)width fontSize:(CGFloat)size string:(NSString *)string {
//    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
//    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
//    ,NSParagraphStyleAttributeName:paragraphstyle.copy
    return [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil].size.height;

}

- (CGFloat)see_heightWithWidth:(CGFloat)width fontSize:(CGFloat)size{
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paragraphstyle.copy} context:nil].size.height;
}

+ (CGFloat)see_stringWidthWithHeight:(CGFloat)height fontSize:(CGFloat)size string:(NSString *)string {
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    return [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paragraphstyle.copy} context:nil].size.width;
    
}

- (CGFloat)see_widthWithHeight:(CGFloat)height fontSize:(CGFloat)size{
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paragraphstyle.copy} context:nil].size.width;
}

+ (NSString *)see_cachePathForURL:(NSString *)url {
    NSString * fileName = [url lastPathComponent];
    NSString * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    return [path stringByAppendingPathComponent:fileName];
}

@end
