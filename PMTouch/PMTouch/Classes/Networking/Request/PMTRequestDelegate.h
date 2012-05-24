//
//  PMTRequestDelegate.h
//  PMTouch
//
//  Created by Massimo Oliviero on 5/23/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMTRequest;

@protocol PMTRequestDelegate <NSObject>

- (void)requestDidStart:(PMTRequest *)request;
- (void)requestDidFinish:(PMTRequest *)request;
- (void)requestDidFail:(PMTRequest *)request;

@end
