//
//  SelectedCarViewController.m
//  HondaEBox
//
//  Created by cloudpower on 14-5-16.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "SelectedCarViewController.h"
#import "UIHelpers.h"
#import "WriteFormViewController.h"
#import "Define.h"
#import "CarSelectedView.h"
#import "AddCarViewController.h"

#define MARGIN 8
#define ADD_CAR_TAG     2000;
#define CONFIRM_CAR_TAG 2001;

@interface SelectedCarViewController ()

@end

@implementation SelectedCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma - BackButton Clicked -
- (void)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"选择车辆" target:self]];
    
    NSMutableArray *carList = [NSMutableArray arrayWithObjects:@"粤A76543", nil];
    _cars = carList;
    
    [self initCarListTable];
//    [self createCarsListView];
}

- (void)createCarsListView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, IsIOS7?64:44, 320, 372)];
    [scrollView setContentSize:CGSizeMake(320, 568)];
    self.contentView = scrollView;
    [self.view addSubview:self.contentView];
    
    int count = _cars.count;
    CGFloat width = 300, height = 100;
    for (int i = 0; i < count; i++)
    {
        CGRect frame = CGRectMake(0, 100 * i + MARGIN, width, height);
        CarSelectedView *carView = [[[NSBundle mainBundle] loadNibNamed:@"CarSelectedView" owner:self options:nil] lastObject];
        [carView setFrame:frame];
        [self.contentView addSubview:carView];
    }
}

- (void)initCarListTable
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 326 - MARGIN) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
    UIButton *addCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addCarBtn.frame = CGRectMake(10 + MARGIN, 393, 138, 30);
    addCarBtn.tag = ADD_CAR_TAG;
    [addCarBtn setBackgroundImage:[UIImage imageNamed:@"1_46.png"] forState:UIControlStateNormal];
    [addCarBtn setTitle:@"添加车辆" forState:UIControlStateNormal];
    [addCarBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addCarBtn addTarget:self action:@selector(operateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addCarBtn];
    
    UIButton *confirmCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmCarBtn.frame = CGRectMake(148 + MARGIN * 2, 393, 138, 30);
    confirmCarBtn.tag = CONFIRM_CAR_TAG;
    [confirmCarBtn setBackgroundImage:[UIImage imageNamed:@"1_46.png"] forState:UIControlStateNormal];
    [confirmCarBtn setTitle:@"确认车辆" forState:UIControlStateNormal];
    [confirmCarBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirmCarBtn addTarget:self action:@selector(operateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmCarBtn];
}

- (void)operateButtonAction:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 2000:
        {
            AddCarViewController *addCarVC = [[AddCarViewController alloc] init];
            [self.navigationController pushViewController:addCarVC animated:YES];
        }
            break;
        case 2001:
        {
            WriteFormViewController *writeFormVC = [[WriteFormViewController alloc] init];
            [self.navigationController pushViewController:writeFormVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_cars objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WriteFormViewController *writeFormVC = [[WriteFormViewController alloc] init];
    [self.navigationController pushViewController:writeFormVC animated:YES];
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
