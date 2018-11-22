//
//  EditUserMessagesViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "EditUserMessagesViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "EditHeadItem.h"
#import "EditDataItem.h"
#import "InvoiceGenerateBaseItem.h"

@interface EditUserMessagesViewController ()

@end

@implementation EditUserMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"编辑资料";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"完成" forState:0];
    
    self.DPManager[@"EditHeadItem"] = @"EditHeadCell";
    self.DPManager[@"EditDataItem"] = @"EditDataCell";
    self.DPManager[@"InvoiceGenerateBaseItem"] = @"InvoiceGenerateBaseCell";
    
    [self setupEditUserMessagesTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - method
- (void) setupEditUserMessagesTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    //更换头像
    EditHeadItem *headItem = [[EditHeadItem alloc] init];
    headItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:headItem];
    
    //用户昵称
    EditDataItem *nickNameItem = [[EditDataItem alloc] init];
    nickNameItem.titleString = @"用户昵称";
    nickNameItem.contentPlaceHolder = @"用户名用户名";
    nickNameItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:nickNameItem];
    
    //注册手机
    EditDataItem *phoneItem = [[EditDataItem alloc] init];
    phoneItem.titleString = @"注册手机";
    phoneItem.contentPlaceHolder = @"13152621916";
    phoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
    phoneItem.showSeperate = @"3";
    [section addItem:phoneItem];
    
    //联系地址
    InvoiceGenerateBaseItem *generateItem = [[InvoiceGenerateBaseItem alloc] init];
    generateItem.titleString = @"联系地址";
    generateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:generateItem];
    
    //联系人
    EditDataItem *contactPersonItem = [[EditDataItem alloc] init];
    contactPersonItem.titleString = @"联系人";
    contactPersonItem.contentPlaceHolder = @"添加联系人";
    contactPersonItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contactPersonItem];
    
    //联系电话
    EditDataItem *contactPhoneItem = [[EditDataItem alloc] init];
    contactPhoneItem.titleString = @"联系电话";
    contactPhoneItem.contentPlaceHolder = @"添加联系电话";
    contactPhoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contactPhoneItem];
    
    //电子邮箱
    EditDataItem *contactEmailItem = [[EditDataItem alloc] init];
    contactEmailItem.titleString = @"电子邮箱";
    contactEmailItem.contentPlaceHolder = @"添加联系邮箱";
    contactEmailItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contactEmailItem];
    
    //所在地区
    EditDataItem *contactAddressItem = [[EditDataItem alloc] init];
    contactAddressItem.titleString = @"所在地区";
    contactAddressItem.contentPlaceHolder = @"添加详细地址";
    contactAddressItem.selectionStyle = UITableViewCellSelectionStyleNone;
    contactAddressItem.showSeperate = @"3";
    [section addItem:contactAddressItem];
    
}

- (void)addRightNavAction {
    [self showHint:@"完成"];
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
