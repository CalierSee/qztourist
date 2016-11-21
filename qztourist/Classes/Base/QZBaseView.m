//
//  QZBaseView.m
//  qztourist
//
//  Created by 景彦铭 on 2016/11/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "QZBaseView.h"

@implementation QZBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadUI];
    }
        return self;
}
    
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    [self loadUI];
}
    
#pragma mark - 载入UI界面
- (void)loadUI {
    
}

@end
