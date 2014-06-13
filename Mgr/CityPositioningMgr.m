//
//  CityPositioningMgr.m
//  honda
//
//  Created by apple on 14-6-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "CityPositioningMgr.h"

@implementation CityPositioningMgr

- (void)queryParams{
    
  
    NSMutableDictionary *body = [NSMutableDictionary dictionary];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:body forKey:@"body"];
    [dict setObject:@"REQ_0006" forKey:@"method"];
    NSLog(@"dict = %@",dict);
    
    [self postWithParams:dict];
    
    
}

-(void)requestSuccessWithData:(NSDictionary *)data
{
    NSString *rspCode = [data objectForKey:@"rspCode"];
    NSString *rspDesc = [data objectForKey:@"rspDesc"];
    
    if (_queryCityPositioningBlock) {
        _queryCityPositioningBlock(rspCode,rspDesc);
    }
    
    
    
}


-(void)requestFailWithErroe:(NSString *)error
{
    
    
}
@end
