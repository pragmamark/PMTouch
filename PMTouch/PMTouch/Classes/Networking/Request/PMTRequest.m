//
//  PMTRequest.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTRequest.h"

@implementation PMTRequest



#pragma mark - Init Methods

- (id)initWithRequestUrl:(NSURL *)requestUrl delegate:(id<PMTRequestDelegate>)delegate
{
    self = [super init];
    
    if (self)
    {
        self.requestUrl = requestUrl;
        self.delegate = delegate;
    }
    
    return self;
}



#pragma mark - Memory Management

- (void)dealloc
{
    [self setDelegate:nil];
    [_requestUrl release];
    [_asi release];
    [super dealloc];
}



#pragma mark - ASIHTTPRequestDelegate Methods

- (void)requestStarted:(ASIHTTPRequest *)request
{
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}



#pragma mark - Properties

@synthesize requestUrl  = _requestUrl;
@synthesize asi         = _asi;
@synthesize delegate    = _delegate;

@end
