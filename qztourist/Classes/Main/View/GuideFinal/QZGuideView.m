//
//  QZGuideView.m
//  qztourist
//
//  Created by 景彦铭 on 2016/11/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "QZGuideView.h"
#import "QZLoginViewController.h"
#import "QZBaseNavigationController.h"
@interface QZGuideView ()
{
    NSInteger _currentIndex;
}

@property(nonatomic,strong)NSArray <UIImage *> * images;

@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,strong)UINavigationController * nav;

@property(nonatomic,weak)UIView * backView;

@end

@implementation QZGuideView

+ (instancetype)guideWithImages:(NSArray<UIImage *> *)images frame:(CGRect)frame{
    QZGuideView * guidV = [[QZGuideView alloc]initWithFrame:frame];
    [guidV loadImages:images];
    return guidV;
}

- (void)loadImages:(NSArray <UIImage *> *)images {
    _images = images;
    [_imageView setImage:images[0]];
}

#pragma mark - 载入UI界面
- (void)loadUI {
    self.backgroundColor = [UIColor redColor];
    UIView * backView = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:backView];
    _backView = backView;
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:self.bounds];
    imageV.backgroundColor = [UIColor whiteColor];
    [backView addSubview:imageV];
    imageV.userInteractionEnabled = YES;
    _imageView = imageV;
    imageV.backgroundColor = [UIColor whiteColor];
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureAction:)];
    [imageV addGestureRecognizer:swipe];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
}

- (void)gestureAction:(UISwipeGestureRecognizer *)gesture {
    [UIView transitionWithView:_imageView duration:0.75 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        if(++_currentIndex != _images.count) {
            [self.imageView setImage:_images[_currentIndex]];
        }
    } completion:nil];
    if(_currentIndex == _images.count){
        CATransition * transition = [CATransition animation];
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.25;
        transition.timeOffset = 0;
        transition.removedOnCompletion = YES;
        QZLoginViewController * loginV = [[QZLoginViewController alloc]init];
        loginV.isGuide = YES;
        QZBaseNavigationController * nav = [[QZBaseNavigationController alloc]initWithRootViewController:loginV];
        _nav = nav;
        [self.backView.layer addAnimation:transition forKey:@"loginAnimation"];
        [self.backView addSubview:nav.view];
            [self.imageView removeFromSuperview];
    }
}




@end
