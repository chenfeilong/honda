//
//  CityPositioningMgr.h
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "BaseMgr.h"

typedef void (^QueryCityPositioningBlock)(NSString *rspCode,NSString *rspDesc);
@interface CityPositioningMgr : BaseMgr

- (void)queryParams;
@property (nonatomic ,copy)QueryCityPositioningBlock queryCityPositioningBlock;
@end
