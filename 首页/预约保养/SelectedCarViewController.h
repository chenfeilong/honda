//
//  SelectedCarViewController.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-16.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_cars;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *contentView;

@end
