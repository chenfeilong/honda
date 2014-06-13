//
//  MaintenanceCalendar.m
//  HondaEBox
//
//  Created by cloudpower on 14-5-12.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "MaintenanceCalendar.h"
#import "UIHelpers.h"
#import "NSDate+convenience.h"
#import "CalendarLabel.h"
#import "DateUtil.h"
#import "MainTainTimeCell.h"
#import "Define.h"
#import "MainTimeButton.h"
#import "SelectedCarViewController.h"

@interface MaintenanceCalendar ()

@end

@implementation MaintenanceCalendar

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
    // Do any additional setup after loading the view.
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"预约时间" target:self]];
    
//    [self initGridHeader];
    [self initGridTableView];
}

#pragma - BackButton Clicked -
- (void)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initGridTableView
{
    _CalenderLabels = [[NSMutableArray alloc] initWithCapacity:0];
    _days = [DateUtil getDatesWithinThreeDays:[NSDate date]];
    NSArray *timeArr = [[NSArray alloc] initWithObjects:@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"15:00",@"15:30",@"16:00",@"16:30", nil];
    _times = timeArr;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 372) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
}

/**
 *  创建选择预约时间HeaderView
 */
- (void)initGridHeader
{
    //    CalendarLabel *calendarLabel = [[CalendarLabel alloc] initWithFrame:CGRectMake(0, 200, 60, 40)];
    //    calendarLabel.backgroundColor = [UIColor cyanColor];
    //    [self.view addSubview:calendarLabel];
    
    _CalenderLabels = [[NSMutableArray alloc] initWithCapacity:0];
    
    //CalendarHeader Label
    CGFloat CL_Width = 180, Btn_Width = 124, CL_Height = 40, origin_y = 64, margin = 8;
    for (int i = 0; i < 5; i++)
    {
        if (i == 0)
        {
            UIImageView *clock = [[UIImageView alloc] initWithFrame:CGRectMake(margin, origin_y + margin, Btn_Width / 2, CL_Height)];
            clock.image = [UIImage imageNamed:@"clock"];
            [self.view addSubview:clock];
        }
        if (i == 4)
        {
            UIButton *calendarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            calendarBtn.frame = CGRectMake(margin + 8 + CL_Width + 62, origin_y + margin, Btn_Width / 2, CL_Height);
            [calendarBtn setBackgroundImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
            [calendarBtn addTarget:self action:@selector(showCalendarView:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:calendarBtn];
        }
        if (i > 0 && i < 4)
        {
            CGRect frame = CGRectMake(margin + Btn_Width / 2 + (60 * (i - 1)), origin_y + margin, CL_Width / 3, CL_Height);
            CalendarLabel *calendarLabel = [[CalendarLabel alloc] initWithFrame:frame];
            [_CalenderLabels addObject:calendarLabel];
            [self.view addSubview:calendarLabel];
        }
    }
    
    //Maintain Time Label
    
}

/**
 *  显示日历
 *
 *  @param sender
 */
- (void)showCalendarView:(id)sender
{
    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.frame = CGRectMake(0, 64, 320, calendar.frame.size.height);
    calendar.delegate=self;
    [self.view addSubview:calendar];
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 22;
}

/*********自定义TableViewHeaderView*********/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat CL_Width = 180, Btn_Width = 124, CL_Height = 40, origin_y = 0, margin = 8;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, CL_Height)];
    [headerView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"底部1.png"]]];
    for (int i = 0; i < 5; i++)
    {
        if (i == 0)
        {
            UIImageView *clock = [[UIImageView alloc] initWithFrame:CGRectMake(margin, origin_y + margin, Btn_Width / 2, CL_Height)];
            clock.image = [UIImage imageNamed:@"1_06.png"];
            [headerView addSubview:clock];
        }
        if (i == 4)
        {
            UIButton *calendarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            calendarBtn.frame = CGRectMake(margin + 8 + CL_Width + 62, origin_y + margin, Btn_Width / 2, CL_Height);
            [calendarBtn setBackgroundImage:[UIImage imageNamed:@"1_25.png"] forState:UIControlStateNormal];
            [calendarBtn addTarget:self action:@selector(showCalendarView:) forControlEvents:UIControlEventTouchUpInside];
            [headerView addSubview:calendarBtn];
        }
        if (i > 0 && i < 4)
        {
            CGRect frame = CGRectMake(margin + Btn_Width / 2 + (60 * (i - 1)), origin_y + margin, CL_Width / 3, CL_Height);
            NSDate *dateTemp = (NSDate *)[_days objectAtIndex:i - 1];
            CalendarLabel *calendarLabel = [[CalendarLabel alloc] initWithFrame:frame date:dateTemp];
            [_CalenderLabels addObject:calendarLabel];
            [headerView addSubview:calendarLabel];
        }
    }
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MainTainTimeCell";
    MainTainTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"MainTainTimeCell" owner:self options:nil];
        if (nibArray.count > 0)
        {
            cell = [nibArray lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.editing = NO;
            cell.viewController = self;
        }
    }
    
    MainTime mainTime_one = {indexPath.row,0};
    cell.btn_one.time = mainTime_one;
    [cell.btn_one addTarget:self action:@selector(selectedTime:) forControlEvents:UIControlEventTouchUpInside];
    
    MainTime mainTime_two = {indexPath.row,1};
    cell.btn_two.time = mainTime_two;
    [cell.btn_two addTarget:self action:@selector(selectedTime:) forControlEvents:UIControlEventTouchUpInside];
    
    MainTime mainTime_three = {indexPath.row,2};
    cell.btn_three.time = mainTime_three;
    [cell.btn_three addTarget:self action:@selector(selectedTime:) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.row % 2 == 0)
    {
        cell.timeLabel.text = [_times objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - 选择预约时间 -
/**
 *  点击按钮弹出Pop视图显示当前选择的时间
 *
 *  @param sender
 */
- (void)selectedTime:(id)sender
{
    MainTimeButton *btn = (MainTimeButton *)sender;
//    DLog(@"{%d,%d}",btn.time.row,btn.time.index);
//    DLog(@"Frame{%f,%f},Point{%f,%f}",btn.frame.origin.x,btn.frame.origin.y,btn.center.x,btn.center.y);
    
    //取出对应的时间
    NSString *time = [_times objectAtIndex:btn.time.row];
    NSDate *date = [_days objectAtIndex:btn.time.index];
    NSString *monthDay = [DateUtil dateStrWithDate:date format:@"MM月dd日"];
    NSString *weekDay = [DateUtil weekDate:date];
//    NSDictionary *mainTimeDic = @{@"time": time,@"monthDay":monthDay,@"weekDay":weekDay};
    NSDictionary *mainTimeDic = [NSDictionary dictionaryWithObjectsAndKeys:time,@"time",monthDay,@"monthDay",weekDay,@"weekDay", nil];
    
    CGPoint point = CGPointZero;
    point.x = 84 + 76 * btn.time.index;
    point.y = 58 + 22 * btn.time.row;
//    UIImageView *textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    textImageView.image = [UIImage imageNamed:@"2.png"];
    UIView *contentView = [self createPopContentViewWithFrame:CGRectMake(0, 0, 100, 100) mainTimeDic:mainTimeDic];
    [PopoverView showPopoverAtPoint:point inView:self.tableView withContentView:contentView delegate:self];
}
/**
 *  创建PopView的ContentView
 *
 *  @param frame
 *  @param mainTimeDic 日期数据字典
 *
 *  @return ContentView
 */
- (UIView *)createPopContentViewWithFrame:(CGRect)frame mainTimeDic:(NSDictionary *)mainTimeDic
{
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
//    headerImageView.image = [UIImage imageNamed:@"white_frame.png"];
    [contentView addSubview:headerImageView];
    
    CGFloat width = headerImageView.frame.size.width, heigth = headerImageView.frame.size.height/3;
    UILabel *mothDayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, heigth)];
    mothDayLabel.font = [UIFont fontWithName:@"Arial" size:14.f];
    mothDayLabel.textAlignment = NSTextAlignmentCenter;
    mothDayLabel.text = [mainTimeDic objectForKey:@"monthDay"];
    [headerImageView addSubview:mothDayLabel];
    UILabel *weekDayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, heigth, width, heigth)];
    weekDayLabel.font = [UIFont fontWithName:@"Arial" size:15.f];
    weekDayLabel.textAlignment = NSTextAlignmentCenter;
    weekDayLabel.text = [mainTimeDic objectForKey:@"weekDay"];
    [headerImageView addSubview:weekDayLabel];
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, heigth * 2, width, heigth)];
    timeLabel.font = [UIFont fontWithName:@"Arial" size:16.f];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = [UIColor redColor];
    timeLabel.text = [mainTimeDic objectForKey:@"time"];
    [headerImageView addSubview:timeLabel];
    
    UIButton *mainTimeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [mainTimeBtn setFrame:CGRectMake(8, 65, 84, 30)];
    [mainTimeBtn setBackgroundImage:[UIImage imageNamed:@"底部1.png"] forState:UIControlStateNormal];
    [mainTimeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainTimeBtn setTitle:@"预约" forState:UIControlStateNormal];
    [mainTimeBtn addTarget:self action:@selector(mainTimeFinished:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:mainTimeBtn];
    
    return contentView;
}

- (void)mainTimeFinished:(UIButton *)sender
{
    UIView *popView = sender.superview.superview;
    [popView removeFromSuperview];
    
    SelectedCarViewController *selectedCarVC = [[SelectedCarViewController alloc] init];
    [self.navigationController pushViewController:selectedCarVC animated:YES];
}

#pragma mark - PopoverViewDelegate Methods

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%s item:%d", __PRETTY_FUNCTION__, index);
    
    //Figure out which string was selected, store in "string"
    
    //Show a success image, with the string from the array
    [popoverView showImage:[UIImage imageNamed:@"success"] withMessage:nil];
    
    //Dismiss the PopoverView after 0.5 seconds
    [popoverView performSelector:@selector(dismiss) withObject:nil afterDelay:0.5f];
}

- (void)popoverViewDidDismiss:(PopoverView *)popoverView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - VRGCalendarViewDelegate -
-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    if (month==[[NSDate date] month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date
{
    NSLog(@"Selected date = %@",date);
    _days = [DateUtil getDatesWithinThreeDays:date];
    [calendarView removeFromSuperview];
    
    [self changeCalenderLabel];
}

- (void)changeCalenderLabel
{
    for (int i = 0; i < 3; i++)
    {
        NSDate *dateTemp = (NSDate *)[_days objectAtIndex:i];
        CalendarLabel *calendarLabel = (CalendarLabel *)[_CalenderLabels objectAtIndex:i];
        
        NSString *weekDay = [DateUtil weekDate:dateTemp];
        NSString *month = [NSString stringWithFormat:@"%d月",[DateUtil getMonthWithDate:dateTemp]];
        NSString *day = [NSString stringWithFormat:@"%d",[DateUtil getDayWithDate:dateTemp]];
        
        calendarLabel.weekDayLabel.text = weekDay;
        calendarLabel.monthLabel.text = month;
        calendarLabel.dayLabel.text = day;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
