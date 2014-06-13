//
//  HomeViewController.m
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "PresonViewController.h"
#import "MaintenanceCalendar.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presonCenterClick:(id)sender {
    PresonViewController *pvc = [[PresonViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
}

- (IBAction)buttonClick:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
        {
            MaintenanceCalendar *maintenanceVC = [[MaintenanceCalendar alloc] init];
            [self.navigationController pushViewController:maintenanceVC animated:YES];
        }
            break;
            
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
            
        case 8:
        {
            
        }
            break;
    }
    
}
@end
