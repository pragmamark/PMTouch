//
//  PMTRequestQueue.h
//  PMTouch
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASINetworkQueue.h"
#import "PMTRequest.h"
#import "PMTRequestQueueDelegate.h"

@interface PMTRequestQueue : NSObject
{
    NSMutableArray                  *_requests;
    NSMutableArray                  *_requestsSuspended;
    ASINetworkQueue                 *_asiQueue;
    id<PMTRequestQueueDelegate>     _delegate;
}

@property (nonatomic, assign) id<PMTRequestQueueDelegate> delegate;

// Queue methods
- (void)addRequest:(PMTRequest *)request;
- (void)startQueue;
- (void)reset;
- (void)stopAllRequest;


// Suspend and Resume methods
- (void)suspendRequests;
- (void)resumeRequests;
- (BOOL)isResumable;

@end
