//
//  BaseMgr.m
//  weibo
//
//  Created by apple on 13-8-18.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseMgr.h"

@implementation BaseMgr
static NSMutableArray *_mgrs;


#pragma mark 返回一个自动释放的对象
+(id)mgr{
    if (!_mgrs) {
        _mgrs = [[NSMutableArray array]retain];
    }
    return [[[[self class]alloc]init]autorelease];
}

#pragma mark 发送一个GET请求
-(void)getWithPath:(NSString *)path params:(NSDictionary *)params{
    //对自己做一次retain操作
    [_mgrs addObject:self];
    
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@",path];
    
    //如果有请求参数
    if (params.count > 0) {
        [urlString appendString:@"?"];
        
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSString *value = [[obj description]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [urlString appendFormat:@"%@=%@&",key,value];
        }];
        
        //删除最后一个&
        NSRange range = [urlString rangeOfString:@"&" options:NSBackwardsSearch];
        [urlString deleteCharactersInRange:range];
        
    }
    
    NSLog(@"urlString = %@",urlString);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.delegate =self;
    
    [request startSynchronous];
}


#pragma mark - POST请求
-(void)postWithParams:(NSDictionary *)params{
    //对自己做一次retain操作
    [_mgrs addObject:self];
    
    if ([NSJSONSerialization isValidJSONObject:params])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        //NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
        
        NSURL *url = [NSURL URLWithString:@"http://192.168.2.254:8080/PowerMAP/json/"];
        self.request = [ASIFormDataRequest requestWithURL:url];
        [self.request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [self.request addRequestHeader:@"Accept" value:@"application/json"];
        [self.request setRequestMethod:@"POST"];
        [self.request setPostBody:tempJsonData];

    }

    
    self.request.delegate = self;
    [self.request startAsynchronous];
}


#pragma mark -ASI代理方法
-(void)requestFinished:(ASIHTTPRequest *)request{
    NSLog(@"responseString = %@",[request responseString]);
    NSString *responseStr = [[request responseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];

    NSDictionary *data = [responseStr JSONValue];
   
    NSLog(@"Dictionary = %@",data);
    //说明服务器端返回有错误信息
    if ([data objectForKey:@"error"]) {
        if ([self respondsToSelector:@selector(requestFailWithErroe:)]) {
            [self requestFailWithErroe:@"服务器忙,请稍后再试"];
        }
    }else {
        if ([self respondsToSelector:@selector(requestSuccessWithData:)]){
            //[NSThread sleepForTimeInterval:5.0f];
            [self requestSuccessWithData:data];
        }
    }
    
    [_mgrs removeObject:self];
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    //说明服务器端返回有错误信息
    if ([self respondsToSelector:@selector(requestFailWithErroe:)]) {
        [self requestFailWithErroe:@"服务器忙,请稍后再试"];
    }
    
    [_mgrs removeObject:self];
}
- (void)dealloc
{
    NSLog(@"%@被回收了",self);
    [self.request setDelegate:nil];
    [self.request cancel];

    [super dealloc];
}

@end
