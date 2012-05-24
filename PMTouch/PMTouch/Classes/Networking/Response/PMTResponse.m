//
//  PMTResponse.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTResponse.h"

@interface PMTResponse ()

@property (nonatomic, retain) PMTRequest *request;
@property (nonatomic, retain) NSString *contentBody;
@property (nonatomic, retain) NSError *error;
@property (nonatomic, retain) NSObject *result;

@end

@implementation PMTResponse


- (id)initWithRequest:(PMTRequest *)request
{
    return [self initWithRequest:request result:nil];
}

- (id)initWithRequest:(PMTRequest *)request result:(NSObject *)result
{
    return [self initWithRequest:request result:result];
}

- (id)initWithRequest:(PMTRequest *)request result:(NSObject *)result error:(NSError *)error
{
    self = [super init];
    
    if (self)
    {
        self.request = request;
        self.result = result;
        self.error = error;
    }
    
    return self;
}


#pragma mark - Memory Management

- (void)dealloc
{
    [_contentBody release];
    [_request release];
    [_result release];
    [_error release];
    [super dealloc];
}



#pragma mark - Properties

@synthesize request     = _request;
@synthesize contentBody = _contentBody;
@synthesize error       = _error;
@synthesize result      = _result;

@end
