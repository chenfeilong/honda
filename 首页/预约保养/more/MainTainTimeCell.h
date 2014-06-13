//
//  MainTainTimeCell.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-15.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "MainTimeButton.h"

@interface MainTainTimeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet MainTimeButton *btn_one;
@property (weak, nonatomic) IBOutlet MainTimeButton *btn_two;
@property (weak, nonatomic) IBOutlet MainTimeButton *btn_three;
@property (strong, nonatomic) UIViewController *viewController;

@end
