//
//  UserAgreementViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "UserAgreementViewController.h"

@interface UserAgreementViewController ()

@property (nonatomic,strong) UIWebView *userAgreeWebView;

@end

@implementation UserAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = DPRedColor;
    
    if ([self.direction isEqualToString:@"1"]) {
        self.title = @"用户协议";
    }else if ([self.direction isEqualToString:@"2"]){
        self.title = @"软件许可及服务协议";
    }else if ([self.direction isEqualToString:@"3"]){
        self.title = @"软件服务协议";
    }
    
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    [self.view addSubview:self.userAgreeWebView];
    
    [self.view setNeedsUpdateConstraints];
}

- (UIWebView *)userAgreeWebView {
    if (!_userAgreeWebView) {
        _userAgreeWebView = [UIWebView newAutoLayoutView];
    }
    return _userAgreeWebView;
}

- (void)layoutConstraints {
    [self.userAgreeWebView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.userAgreeWebView autoPinToTopLayoutGuideOfViewController:self withInset:0];
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
