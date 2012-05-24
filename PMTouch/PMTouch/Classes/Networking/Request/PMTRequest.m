//
//  PMTRequest.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTRequest.h"

@interface PMTRequest ()

@property (nonatomic) ASIHTTPRequest *asi;

@end

@implementation PMTRequest



#pragma mark - Init Methods





#pragma mark - Memory Management

- (void)dealloc
{
    [self setDelegate:nil];

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

@synthesize asi      = _asi;
@synthesize delegate = _delegate;

@end
