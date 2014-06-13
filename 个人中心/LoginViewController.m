//
//  LoginViewController.m
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "LoginMgr.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"登录" target:self]];
    
    //隐藏软键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];

    
    UIImageView *userNameImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_13.png"]];
    _userName.leftView = userNameImage;
    _userName.leftViewMode = UITextFieldViewModeAlways;
    _userName.leftView.frame =CGRectMake(50, 5, 35, 35);
    
    UIImageView *passwordImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_11"]];
    _password.leftView = passwordImage;
    _password.leftViewMode = UITextFieldViewModeAlways;
    _password.leftView.frame =CGRectMake(50, 5, 32, 35);

}

#pragma - BackButton Clicked -
- (void)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    
    [_userName resignFirstResponder];
    [_password resignFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
        {
           
            LoginMgr *mgr = [LoginMgr mgr];
            [mgr queryParamsWithUserName:_userName.text password:_password.text];
            mgr.queryLoginBlock = ^(NSString *rspCode, NSString *rspDesc){
                NSLog(@"rspCode = %@",rspCode);
                NSLog(@"rspDesc = %@",rspDesc);
        };
            
            
        }
            break;
            
        case 1:
        {
            RegistViewController *rvc = [[RegistViewController alloc]init];
            [self.navigationController pushViewController:rvc animated:YES];
        }
            break;
            
        case 2:
        {
        
        }
            break;
        default:
            break;
    }
}
@end
