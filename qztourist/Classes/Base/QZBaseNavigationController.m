//
//  QZBaseNavigationController.m
//  qztourist
//
//  Created by 景彦铭 on 2016/11/20.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "QZBaseNavigationController.h"

@interface QZBaseNavigationController ()

@end

@implementation QZBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    // Do any additional setup after loading the view.
}

- (void)loadUI {
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    //导航条颜色
    [self.navigationBar setBarTintColor:[UIColor redColor]];
    
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
