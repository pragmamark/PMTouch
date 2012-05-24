//
//  PMTClient.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTClient.h"

@interface PMTClient ()

@property (nonatomic, retain) NSURL *baseUrl; 

@end

@implementation PMTClient

- (id)initWithBaseURL:(NSURL *)baseUrl
{
    return [self initWithBaseURL:baseUrl username:nil password:nil];
}

- (id)initWithBaseURL:(NSURL *)baseUrl username:(NSString *)username password:(NSString *)password
{
    self = [super init];
    
    if (self)
    {
        self.baseUrl = baseUrl;
        self.username = username;
        self.password = password;
    }
    
    return self;
}

- (void)dealloc
{
    [_username release];
    [_password release];
    [_baseUrl release];
    [super dealloc];
}

- (PMTRequest *)createRequest:(NSString *)stringUrl delegate:(id<PMTRequestDelegate>)delegate
{
    // creation
    NSURL *requestUrl = [self.baseUrl URLByAppendingPathComponent:stringUrl];
    PMTRequest *request = [[PMTRequest alloc] initWithRequestUrl:requestUrl delegate:delegate];
    
    // auth
    request.asi.username = self.username;
    request.asi.password = self.password;
    
    return [request autorelease];
}


#pragma mark - Properties

@synthesize baseUrl     = _baseUrl;
@synthesize username    = _username;
@synthesize password    = _password;

@end
