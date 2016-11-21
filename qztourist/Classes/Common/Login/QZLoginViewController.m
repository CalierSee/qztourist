//
//  QZLoginViewController.m
//  qztourist
//
//  Created by 景彦铭 on 2016/11/20.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "QZLoginViewController.h"

@interface QZLoginViewController ()<UITextFieldDelegate,CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UITextField *userLabel;
@property (weak, nonatomic) IBOutlet UITextField *passLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginAfterButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassButton;
@property (weak, nonatomic) IBOutlet UIButton *WXLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *QQLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *SinaLoginButton;
@property (weak, nonatomic) IBOutlet UIView *userLine;
@property (weak, nonatomic) IBOutlet UIView *passLine;
@property (weak, nonatomic) IBOutlet UIView *userLeft;
@property (weak, nonatomic) IBOutlet UIView *userRight;
@property (weak, nonatomic) IBOutlet UIView *passLeft;
@property (weak, nonatomic) IBOutlet UIView *passRight;

@end

@implementation QZLoginViewController

#pragma mark - life circle 控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadColor];
    [self loadImage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

#pragma mark - UIKit方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - custom methods 自定义方法
- (void)loadUI {
    //登录标题
    UILabel * label = [UILabel see_createWithFrame:CGRectMake(0, 0, 50, 16) textColor:[UIColor whiteColor] fontSize:15 text:@"登录"];
    label.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:label];
    //注册按钮
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerUsers)];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = item;
    self.iconView.layer.cornerRadius = 13;
    self.iconView.clipsToBounds = YES;
    self.userLabel.borderStyle = UITextBorderStyleNone;
    self.passLabel.borderStyle = UITextBorderStyleNone;
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.clipsToBounds = YES;
    self.WXLoginButton.layer.cornerRadius = 24;
    self.WXLoginButton.clipsToBounds = YES;
    self.QQLoginButton.layer.cornerRadius = 24;
    self.QQLoginButton.clipsToBounds = YES;
    self.SinaLoginButton.layer.cornerRadius = 24;
    self.SinaLoginButton.clipsToBounds = YES;
    self.userLabel.delegate = self;
    self.passLabel.delegate = self;
    [self.WXLoginButton addTarget:self action:@selector(WXButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadColor {
    self.view.backgroundColor = [UIColor see_colorWithHex:0x01384f];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.userLabel setValue:[UIColor see_colorWithHex:0x809ca7] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passLabel setValue:[UIColor see_colorWithHex:0x809ca7] forKeyPath:@"_placeholderLabel.textColor"];
    [self.loginAfterButton setTitleColor:[UIColor see_colorWithHex:0x416a7b] forState:UIControlStateNormal];
    [self.forgetPassButton setTitleColor:[UIColor see_colorWithHex:0x416a7b] forState:UIControlStateNormal];
}

- (void)loadImage {
    
}

- (void)registerUsers {
    
}

- (IBAction)loginButtonClick:(UIButton *)sender {
    
}

- (IBAction)loginAfterButtonClick:(UIButton *)sender {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录后才能够获得个性化推荐内容，确定不登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * done = [UIAlertAction actionWithTitle:@"在考虑一下" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"残忍拒绝" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(_isGuide){
            [UIView animateWithDuration:0.5 animations:^{
                self.navigationController.view.superview.superview.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
                self.navigationController.view.superview.superview.alpha = 0;
            } completion:^(BOOL finished) {
                [self.navigationController.view.superview.superview removeFromSuperview];
            }];
        }
        else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [alert addAction:done];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)forgetPassButtonClick:(UIButton *)sender {
    
}

- (IBAction)WXButtonClick:(UIButton *)sender {
    
}

- (IBAction)QQButtonClick:(UIButton *)sender {
    
}

- (IBAction)SinaButtonClick:(UIButton *)sender {
    
}

- (void)lineAnimationWithLine:(UIView *)view {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(view.layer.position.x, view.layer.position.y)],[NSValue valueWithCGPoint:CGPointMake(view.layer.position.x, view.layer.position.y - 3)]];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    animation.duration = 1.5;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:@"lineAnimation"];
}

#pragma mark - delegate and datasource 代理和数据源协议
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == self.userLabel){
        [self.passLabel becomeFirstResponder];
    }
    else if(textField == self.passLabel){
        if(self.userLabel.text.length){
            [self loginButtonClick:self.loginButton];
        }
        else{
            [self.userLabel becomeFirstResponder];
        }
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField == self.userLabel){
        [self lineAnimationWithLine:self.userLine];
    }
    else {
        [self lineAnimationWithLine:self.passLine];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if(textField == self.userLabel){
        [self.userLine.layer removeAllAnimations];
    }
    else {
        [self.passLine.layer removeAllAnimations];
    }
    return YES;
}

#pragma mark - getter and setter 属性getter、setter

@end
