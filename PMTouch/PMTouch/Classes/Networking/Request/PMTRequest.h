//
//  PMTRequest.h
//  PMTouch
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PMTRequestDelegate.h"
#import "ASIHTTPRequest.h"

@interface PMTRequest : NSObject <ASIHTTPRequestDelegate>
{
    ASIHTTPRequest          *_asi;
    id<PMTRequestDelegate>  _delegate;
}

@property (nonatomic, readonly) ASIHTTPRequest *asi;
@property (nonatomic, assign) id<PMTRequestDelegate> delegate;

@end
