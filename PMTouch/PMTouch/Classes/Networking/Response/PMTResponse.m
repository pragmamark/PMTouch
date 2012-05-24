//
//  PMTResponse.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTResponse.h"

@implementation PMTResponse



#pragma mark - Memory Management

- (void)dealloc
{
    [_contentBody release];
    [_request release];
    [super dealloc];
}



#pragma mark - Properties

@synthesize request     = _request;
@synthesize contentBody = _contentBody;

@end
