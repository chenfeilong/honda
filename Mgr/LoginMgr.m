//
//  LoginMgr.m
//  Meifu 9.5
//
//  Created by apple on 13-10-24.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "LoginMgr.h"
#import "ExtendClass.h"
@implementation LoginMgr

- (void)queryParamsWithUserName:(NSString *)userName password:(NSString *)password;
{
    UIDevice *device_=[[UIDevice alloc] init];
//    NSLog(@"设备所有者的名称－－%@",device_.name);
//    NSLog(@"设备的类别－－－－－%@",device_.model);
//    NSLog(@"设备的的本地化版本－%@",device_.localizedModel);
//    NSLog(@"设备运行的系统－－－%@",device_.systemName);
//    NSLog(@"当前系统的版本－－－%@",device_.systemVersion);
    NSLog(@"设备识别码－－－－－%@",device_.identifierForVendor.UUIDString);
     NSMutableDictionary *body = [NSMutableDictionary dictionary];
    [body setObject:userName forKey:@"userName"];
    
    password = [password md5HexDigest];
    [body setObject:password forKey:@"password"];
    [body setObject:device_.identifierForVendor.UUIDString forKey:@"deviceId"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:body forKey:@"body"];
    [dict setObject:@"REQ_0001" forKey:@"method"];
    NSLog(@"dict = %@",dict);

    
    [self postWithParams:dict];
    
}


- (NSString*)md5:(NSString*)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,strlen(cStr),result);
    NSString *MD5 = [NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                     result[0], result[1], result[2], result[3],
                     result[4], result[5], result[6], result[7],
                     result[8], result[9], result[10], result[11],
                     result[12], result[13], result[14], result[15]
                     ];
    
    return [MD5 lowercaseString];
}


-(void)requestSuccessWithData:(NSDictionary *)data
{
    NSString *rspCode = [data objectForKey:@"rspCode"];
    NSString *rspDesc = [data objectForKey:@"rspDesc"];
   

    if (_queryLoginBlock) {
        _queryLoginBlock(rspCode,rspDesc);
    }
    
}


-(void)requestFailWithErroe:(NSString *)error
{
    

}

@end
