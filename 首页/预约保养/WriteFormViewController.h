//
//  WriteFormViewController.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-16.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteFormViewController : UIViewController<UITextFieldDelegate>
{
    NSArray *_titleArr;
    int _keyboardMargin;
}

@property (nonatomic, strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_carType;
@property (weak, nonatomic) IBOutlet UITextField *tf_carNo;
@property (weak, nonatomic) IBOutlet UITextField *tf_serverType;
@property (weak, nonatomic) IBOutlet UITextField *tf_time;
@property (weak, nonatomic) IBOutlet UITextField *tf_phoneNo;
@property (weak, nonatomic) IBOutlet UITextField *tf_mileage;

@end
