//
//  QZMainViewController.m
//  qztourist
//
//  Created by 景彦铭 on 2016/11/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//
#define GUIDENUMBER 2
#import "QZMainViewController.h"
#import "QZGuideView.h"
#import "QZBaseNavigationController.h"
@interface QZMainViewController ()
@property(nonatomic,weak)UITabBarController *tabBarController;
@property(nonatomic,strong)NSArray <UIImage *> * images;
@end

@implementation QZMainViewController

#pragma mark - life circle 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //判断是否显示引导
    [self showGuide];
    //载入控制器
    [self loadController];
    // Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if(self.view.window == nil){
        self.view = nil;
        //清理当前控制器属性
        
    }
}
#pragma mark - custom methods 自定义方法
//显示引导
- (void)showGuide {
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"guide"]){
        return ;
    }
    else {
        QZGuideView * guidVC = [QZGuideView guideWithImages:self.images frame:[UIScreen mainScreen].bounds];
        [self.view addSubview:guidVC];
        /*记录*/
        //[[NSUserDefaults standardUserDefaults]setObject:@(1) forKey:@"guide"];
    }
}

//载入主界面
- (void)loadUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UITabBarController * tabBarController = [[UITabBarController alloc]init];
    //添加tabBar
    [self.view addSubview:tabBarController.view];
    [self addChildViewController:tabBarController];
    [tabBarController didMoveToParentViewController:self];
    _tabBarController = tabBarController;
    //设置文字显示颜色
    [tabBarController.tabBar setTintColor:[UIColor see_colorWithHex:0x98d361]];
    [tabBarController.tabBar setUnselectedItemTintColor:[UIColor see_colorWithHex:0x948475]];

}

//载入控制器
- (void)loadController {
    NSArray <NSDictionary *> * viewControllers = @[
                                                   @{@"name":@"首页",@"class":@"QZHomeViewController",@"image":@"",@"selectImage":@""},
                                                   @{@"name":@"探索",@"class":@"QZExploreViewController",@"image":@"",@"selectImage":@""},
                                                   @{@"name":@"游记",@"class":@"QZTravelsViewController",@"image":@"",@"selectImage":@""},
                                                   @{@"name":@"我的",@"class":@"QZMineViewController",@"image":@"",@"selectImage":@""}
                                                   ];
    NSMutableArray * vcM = [NSMutableArray arrayWithCapacity:viewControllers.count];
    
    [viewControllers enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //设置viewController
        UIViewController * vc = [[NSClassFromString(obj[@"class"]) alloc]init];
        vc.title = obj[@"name"];
        QZBaseNavigationController * NVc = [[QZBaseNavigationController alloc]initWithRootViewController:vc];
        [vcM addObject:NVc];
        //设置导航栏image
        [vc.tabBarItem setImage:[UIImage imageNamed:obj[@"image"]]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:obj[@"selectImage"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }];
    [_tabBarController setViewControllers:vcM.copy];
}

#pragma mark - delegate and datasource 代理和数据源协议



#pragma mark - getter and setter 属性getter、setter

- (NSArray<UIImage *> *)images {
    if(_images == nil){
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSInteger i  = 0; i < GUIDENUMBER; i++) {
            @autoreleasepool {
                NSString * str = [NSString stringWithFormat:@"special%zd@2x.png",i];
                UIImage * image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:str ofType:nil]];
                [arrM addObject:image];
            }
        }
        _images = arrM.copy;
    }
    return _images;
}


@end
