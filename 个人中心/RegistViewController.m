//
//  RegistViewController.m
//  HondaEBox
//
//  Created by cloudpower on 14-5-18.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "RegistViewController.h"
#import "UIHelpers.h"
#import "RegisterMgr.h"
#import "CityPositionViewController.h"
#import "CityPositioningMgr.h"
@interface RegistViewController ()

@end

@implementation RegistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"注册" target:self]];
    
    //隐藏软键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    
    UIImageView *userNameImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_13.png"]];
    _userName.leftView = userNameImage;
    _userName.leftViewMode = UITextFieldViewModeAlways;
    _userName.leftView.frame =CGRectMake(50, 5, 35, 35);
    
    UIImageView *emailImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_68"]];
    _email.leftView = emailImage;
    _email.leftViewMode = UITextFieldViewModeAlways;
    _email.leftView.frame =CGRectMake(50, 5, 35, 35);
  
    UIImageView *passwordImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_59"]];
    _password.leftView = passwordImage;
    _password.leftViewMode = UITextFieldViewModeAlways;
    _password.leftView.frame =CGRectMake(50, 5, 35, 35);
    
    UIImageView *repasswordImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心切图_11"]];
    _repassword.leftView = repasswordImage;
    _repassword.leftViewMode = UITextFieldViewModeAlways;
    _repassword.leftView.frame =CGRectMake(50, 5, 35, 35);
    
    UIImageView *phoneNumImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"未标题-1_17"]];
    _phoneNum.leftView = phoneNumImage;
    _phoneNum.leftViewMode = UITextFieldViewModeAlways;
    _phoneNum.leftView.frame =CGRectMake(50, 5, 35, 35);
}


-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    
    [_userName resignFirstResponder];
    [_email resignFirstResponder];
    [_password resignFirstResponder];
    [_repassword resignFirstResponder];
    [_phoneNum resignFirstResponder];
    
}

#pragma - BackButton Clicked -
- (void)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:{
            
            CityPositioningMgr *mgr = [CityPositioningMgr mgr];
            [mgr queryParams];
            mgr.queryCityPositioningBlock = ^(NSString *rspCode,NSString *rspDesc){
                NSLog(@"rspCode = %@",rspCode);
                NSLog(@"rspDesc = %@",rspDesc);
                
                
            };

            
//            CityPositionViewController *cpvc = [[CityPositionViewController alloc]init];
//            [self.navigationController pushViewController:cpvc animated:YES];
            
        }
            
            break;
            
        case 1:
        {
        
        }
            break;
        case 2:
        {
            if (btn.selected == NO) {
                btn.selected = YES;
            }else
                btn.selected = NO;
        }
            break;
            
        case 3:
        {
            RegisterMgr *mgr = [RegisterMgr mgr];
            NSArray *arr = [NSArray array];
            [mgr queryParamsWithUserName:_userName.text email:_email.text password:_password.text phoneNum:_phoneNum.text city:@"11" dealers:arr];
            mgr.queryRegisterBlock = ^(NSString *rspCode,NSString *rspDesc){
                NSLog(@"rspCode = %@",rspCode);
                NSLog(@"rspDesc = %@",rspDesc);
                

        };
            
        }
            
            break;
        
    }
    
    
}
@end
