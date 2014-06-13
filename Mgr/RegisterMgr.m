//
//  RegisterMgr.m
//  HondaEBox
//
//  Created by apple on 14-6-12.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "RegisterMgr.h"
#import "ExtendClass.h"

@implementation RegisterMgr

- (void)queryParamsWithUserName:(NSString *)userNmae email:(NSString *)email password:(NSString *)password phoneNum:(NSString *)phoneNum city:(NSString *)city dealers:(NSArray*)dealers{
    
    NSMutableDictionary *body = [NSMutableDictionary dictionary];
    
    
    [body setObject:userNmae forKey:@"userName"];
    [body setObject:email forKey:@"email"];
    password = [password md5HexDigest];
    [body setObject:password forKey:@"password"];
    [body setObject:phoneNum forKey:@"mobile"];
    [body setObject:city forKey:@"city"];
    [body setObject:dealers forKey:@"dealers"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:body forKey:@"body"];
    [dict setObject:@"REQ_0002" forKey:@"method"];
    NSLog(@"dict = %@",dict);
    
    
    [self postWithParams:dict];
    

}

-(void)requestSuccessWithData:(NSDictionary *)data
{
    NSString *rspCode = [data objectForKey:@"rspCode"];
    NSString *rspDesc = [data objectForKey:@"rspDesc"];
    
    if (_queryRegisterBlock) {
        _queryRegisterBlock(rspCode,rspDesc);
    }
    
    
    
}


-(void)requestFailWithErroe:(NSString *)error
{

    
}
@end
