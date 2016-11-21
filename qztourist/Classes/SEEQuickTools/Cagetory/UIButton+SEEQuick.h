//
//  UIButton+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SEEQuick)
///  创建带文字的UIButton对象
///
///  @param frame    frame
///  @param title    显示文字
///  @param color    文字颜色
///  @param state    状态
///  @param target   监听者
///  @param selector 响应方法
///  @param event    监听事件
+ (instancetype)see_createWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)color forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

///  创建带图片的Button对象
///
///  @param frame     frame
///  @param image 图片名
///  @param state     状态
///  @param target    监听者
///  @param selector  响应方法
///  @param event     监听事件
+ (instancetype)see_createWithFrame:(CGRect)frame image:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

///  创建带背景图片的UIButton对象
///
///  @param frame     frame
///  @param image 图片名
///  @param state     状态
///  @param target    监听者
///  @param selector  响应方法
///  @param event     监听事件
+ (instancetype)see_createWithFrame:(CGRect)frame backgroundImage:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

///  创建带背景颜色的UIButton对象
///
///  @param frame    frame
///  @param color    颜色
///  @param target   监听者
///  @param selector 响应方法
///  @param event    监听事件
+ (instancetype)see_createWithFrame:(CGRect)frame backgroundColor:(UIColor *)color andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

///  设置按钮title
///
///  @param state 状态
///  @param title 文字
///  @param color 文字颜色
-(void)see_setTitleForState:(UIControlState)state title:(NSString *)title titleColor:(UIColor *)color;

///  设置按钮title以及字体大小
///
///  @param state 状态
///  @param size  字体大小
///  @param title 文字
///  @param color 文字颜色
-(void)see_setTitleForState:(UIControlState)state fontSize:(NSInteger)size title:(NSString *)title titleColor:(UIColor *)color;

///  创建title大小的button
///
///  @param title    文字内容
///  @param color    文字颜色
///  @param state    状态
///  @param target   监听对象
///  @param selector 响应方法
///  @param event    响应事件
+ (instancetype)see_createWithTitle:(NSString *)title titleColor:(UIColor *)color forState:(UIControlState)state target:(id)target selector:(SEL)selector event:(UIControlEvents)event;
///  根据背景图片确定大小
///
///  @param image    背景图片
///  @param state    状态
///  @param target   监听对象
///  @param selector 响应方法
///  @param event    响应时间
+ (instancetype)see_createWithBackgroundImage:(UIImage *)image forState:(UIControlState)state andTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

///  为一个button对象设置图文混合文字
///
///  @param imageName    图片
///  @param size    图片大小
///  @param title   文字
///  @param color   文字颜色
///  @param fontSize 文字大小
///  @param space    行间距
- (void)see_buttonWithImageName:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space;

- (void)see_buttonWithImage:(UIImage *)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space;
@end
