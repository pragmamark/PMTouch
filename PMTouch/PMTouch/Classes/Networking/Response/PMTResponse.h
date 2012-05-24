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
}

@property (nonatomic, retain) PMTRequest *request;
@property (nonatomic, readonly) NSString *contentBody;

@end
