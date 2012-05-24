//
//  PMTClient.h
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PMTRequest.h"

@interface PMTClient : NSObject
{
    NSURL       *_baseUrl;
    NSString    *_username;
    NSString    *_password;
}

@property (nonatomic, retain, readonly) NSURL   *baseUrl;
@property (nonatomic, copy) NSString            *username;
@property (nonatomic, copy) NSString            *password;

- (id)initWithBaseURL:(NSURL *)baseUrl;
- (id)initWithBaseURL:(NSURL *)baseUrl username:(NSString *)username password:(NSString *)password;

- (PMTRequest *)createRequest:(NSString *)stringUrl delegate:(id<PMTRequestDelegate>)delegate;

@end
