//
//  MaintenanceCalendar.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-12.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRGCalendarView.h"
#import "PopoverView.h"

@interface MaintenanceCalendar : UIViewController<VRGCalendarViewDelegate,UITableViewDataSource,UITableViewDelegate,PopoverViewDelegate>
{
    NSMutableArray *_CalenderLabels;
    NSArray *_days;
    NSArray *_times;
}

@property (nonatomic, strong) UITableView *tableView;

@end
