//
//  PresonViewController.m
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "PresonViewController.h"
#import "LoginViewController.h"


@interface PresonViewController ()

@end

@implementation PresonViewController

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
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"个人中心" target:self]];
    if (!iPhone5) {
        self.myScrollView.contentSize = CGSizeMake(320, 500);
    }
    
    
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

- (IBAction)buttonClick:(id)sender {
    
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
        {
            LoginViewController *lvc = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:lvc animated:YES];
            NSLog(@"登录");
            
        }
            break;
            
        default:
            break;
    }
}

@end
