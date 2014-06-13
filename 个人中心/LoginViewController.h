//
//  LoginViewController.h
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ViewController.h"

@interface LoginViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)buttonClick:(id)sender;

@end
