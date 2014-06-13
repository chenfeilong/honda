//
//  LoginMgr.h
//  Meifu 9.5
//
//  Created by apple on 13-10-24.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseMgr.h"

typedef void (^QueryLoginBlock)(NSString *rspCode,NSString *rspDesc);

@interface LoginMgr : BaseMgr

- (void)queryParamsWithUserName:(NSString *)userName password:(NSString *)password;

@property (nonatomic ,copy)QueryLoginBlock queryLoginBlock;


@end
