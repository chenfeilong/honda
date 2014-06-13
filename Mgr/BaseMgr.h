//
//  BaseMgr.h
//  weibo
//
//  Created by apple on 13-8-18.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"

@interface BaseMgr : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic, strong)ASIFormDataRequest *request;

-(void)getWithPath:(NSString *)path params:(NSDictionary *)params;
-(void)postWithParams:(NSDictionary*)params;
- (NSMutableDictionary*)getAuthenticator:(NSMutableDictionary *)params;

//快速获取一个mgr对象
+(id)mgr;

//这些方法留给子类去实现
-(void)requestSuccessWithData:(NSDictionary *)data;
-(void)requestFailWithErroe:(NSString *)error;

@end
