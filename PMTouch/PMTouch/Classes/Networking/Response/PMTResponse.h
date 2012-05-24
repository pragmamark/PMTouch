//
//  PMTResponse.h
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMTRequest;

@interface PMTResponse : NSObject
{
    PMTRequest  *_request;
    NSString    *_contentBody;
    NSError     *_error;
    NSObject    *_result;
}

@property (nonatomic, retain, readonly) PMTRequest *request;
@property (nonatomic, retain, readonly) NSString *contentBody;
@property (nonatomic, retain, readonly) NSError *error;
@property (nonatomic, retain, readonly) NSObject *result;

- (id)initWithRequest:(PMTRequest *)request;
- (id)initWithRequest:(PMTRequest *)request result:(NSObject *)result;
- (id)initWithRequest:(PMTRequest *)request result:(NSObject *)result error:(NSError *)error;

@end
