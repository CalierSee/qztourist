//
//  UIButton+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIButton+SEEQuick.h"
#import "NSAttributedString+SEEQuick.h"
@implementation UIButton (SEEQuick)
+ (instancetype)see_createWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)color forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}

+ (instancetype)see_createWithTitle:(NSString *)title titleColor:(UIColor *)color forState:(UIControlState)state target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}

+ (instancetype)see_createWithFrame:(CGRect)frame image:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:image forState:state];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}

+ (instancetype)see_createWithFrame:(CGRect)frame backgroundImage:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setBackgroundImage:image forState:state];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}

+ (instancetype)see_createWithBackgroundImage:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]init];
    [button setBackgroundImage:image forState:state];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}


+ (instancetype)see_createWithFrame:(CGRect)frame backgroundColor:(UIColor *)color andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setBackgroundColor:color];
    [button addTarget:target action:selector forControlEvents:event];
    return button;
}

-(void)see_setTitleForState:(UIControlState)state title:(NSString *)title titleColor:(UIColor *)color {
    [self setTitleColor:color forState:state];
    [self setTitle:title forState:state];
}

-(void)see_setTitleForState:(UIControlState)state fontSize:(NSInteger)size title:(NSString *)title titleColor:(UIColor *)color {
    [self setTitleColor:color forState:state];
    [self setTitle:title forState:state];
    [self.titleLabel setFont:[UIFont systemFontOfSize:size]];
}

- (void)see_buttonWithImageName:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space {
    //设置属性文字
    [self setAttributedTitle:[NSAttributedString see_attributedStringWithImage:[UIImage imageNamed:imageName] imageSize:size title:title titleColor:color fontSize:fontSize lineSpace:space] forState:UIControlStateNormal];
    //设置自动换行和居中显示
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

- (void)see_buttonWithImage:(UIImage *)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space {
    //设置属性文字
    [self setAttributedTitle:[NSAttributedString see_attributedStringWithImage:image imageSize:size title:title titleColor:color fontSize:fontSize lineSpace:space] forState:UIControlStateNormal];
    //设置自动换行和居中显示
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

@end
