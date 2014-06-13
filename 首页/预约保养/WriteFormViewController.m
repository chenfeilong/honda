//
//  WriteFormViewController.m
//  HondaEBox
//
//  Created by cloudpower on 14-5-16.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "WriteFormViewController.h"
#import "UIHelpers.h"
//#import "NetWorking.h"
//#import "Utils.h"

@interface WriteFormViewController ()
{
    BOOL keyboardShow;
}

@end

@implementation WriteFormViewController

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
    [self.view addSubview:[UIHelpers headerViewWithImage:[UIImage imageNamed:@"底部1.png"] title:@"填写预约单" target:self]];
    [self.contentView setContentSize:CGSizeMake(320, 568)];
    
    
    //Register Keyboard Event Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowNotification:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHiddenNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHidden:)];
    [self.view addGestureRecognizer:tabGesture];
    
}

#pragma - BackButton Clicked -
- (void)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)commitMainTain:(id)sender {
//    NSDictionary *bodyDic = [NSDictionary alloc] initWithObjectsAndKeys:_tf_carType,@"carType",_tf_carNo.text,@"carNumber",_tf_name.text,@"name",_tf_phoneNo,@"phone",_tf_time.text,@"bookTime",_tf_mileage.text,@"distance",@"",@"<#string#>", nil
    NSDictionary *bodyDic = @{@"carType": _tf_carType.text,
                              @"carNumber":_tf_carNo.text,
                              @"engineNumber":@"12345",
                              @"name":_tf_name.text,
                              @"phone":_tf_phoneNo.text,
                              @"bookTime":_tf_time.text,
                              @"distance":_tf_mileage.text,
                              @"dealerId":@"广州店",
                              @"customerId":@"1234567890"};
    
//    NetWorking *netWork = [NetWorking shareNetWorking];
//    [netWork mainTainServer:bodyDic];
}

#pragma mark - UITextFieldDelegate -
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    CGRect frame = textField.frame;
//    int offset = frame.origin.y + 30 - (self.view.frame.size.height - 216.0); //键盘高度216
//    
//    NSLog(@"*****%f",self.contentView.contentSize.height);
//    
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:0.30f];
//    if (offset > 0)
//    {
//        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
//    }
//    else
//    {
//        [self.contentView scrollRectToVisible:textField.frame animated:YES];
//    }
//    [UIView commitAnimations];
//}

//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
////    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)keyboardHidden:(UITapGestureRecognizer *)tagGesture
{
    [self.view endEditing:NO];
}

- (void)keyboardDidShowNotification:(NSNotification *)notification
{
//    NSDictionary *info = notification.userInfo;
//    NSValue *rectV = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyBoardRect = rectV.CGRectValue;
//    NSNumber *durationV = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    float off = 0;
//    {
//        UIView *textField = [Utils editingTextField:self.view];
//        if( textField == nil ){
//            return;
//        }
//        CGRect fieldFrame = [textField convertRect:textField.bounds fromView:APPDELEGATE.window];
//        off = keyBoardRect.origin.y - (-fieldFrame.origin.y +  fieldFrame.size.height);
//        if( off < 0 ){
//            if( _keyboardMargin < 0 ){
//                _keyboardMargin += off;
//            }else{
//                _keyboardMargin = off;
//            }
//            [UIView beginAnimations:@"textFieldAnim" context:nil];
//            [UIView setAnimationBeginsFromCurrentState:YES];
//            [UIView setAnimationDuration:durationV.doubleValue];
//            UIView *view_move = (UIView *)self.view;
//            view_move.frame = CGRectOffset(view_move.frame, 0, off);//整个view整体y轴移动off
//            [UIView commitAnimations];
//            return;
//        }
//    }
//    if( _keyboardMargin < 0 ){
//        CGRect viewFrame = [self.view convertRect:self.view.bounds fromView:APPDELEGATE.window];
//        //当最下方有个textfiled，当键盘高度变矮时,可能self.view最下方的底，于键盘的最上方有空隙
//        //这时要那啥一下
//        float off = keyBoardRect.origin.y - (-viewFrame.origin.y +  viewFrame.size.height);
//        if( off > 0 ){
//            _keyboardMargin += off;
//            [UIView beginAnimations:@"textFieldAnim" context:nil];
//            [UIView setAnimationBeginsFromCurrentState:YES];
//            [UIView setAnimationDuration:durationV.doubleValue];
//            UIView *view_move = (UIView *)self.view;
//            view_move.frame = CGRectOffset(view_move.frame, 0, off);
//            [UIView commitAnimations];
//        }
//    }
}

- (void)keyboardWillHiddenNotification:(NSNotification *)notification
{
    if( _keyboardMargin < 0 ){
        NSDictionary *info = notification.userInfo;
        NSNumber *durationV = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        [UIView beginAnimations:@"textFieldAnim" context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:durationV.doubleValue];
        UIView *view_move = (UIView *)self.view;
        view_move.frame = CGRectOffset(view_move.frame, 0, -_keyboardMargin);
        [UIView commitAnimations];
        _keyboardMargin = 0;
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
