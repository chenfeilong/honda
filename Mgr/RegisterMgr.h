//
//  RegisterMgr.h
//  HondaEBox
//
//  Created by apple on 14-6-12.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "BaseMgr.h"

typedef void (^QueryRegisterBlock)(NSString *rspCode,NSString *rspDesc);
@interface RegisterMgr : BaseMgr

- (void)queryParamsWithUserName:(NSString *)userNmae email:(NSString *)email password:(NSString *)password phoneNum:(NSString *)phoneNum city:(NSString *)city dealers:(NSArray *)dealers;

@property (nonatomic ,copy)QueryRegisterBlock queryRegisterBlock;

@end
