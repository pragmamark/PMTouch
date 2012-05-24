//
//  PMTRequestQueue.m
//  PMTouch
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMTRequestQueue.h"

@interface PMTRequestQueue () 

@property (nonatomic, retain) NSMutableArray    *requestsSuspended;
@property (nonatomic, retain) NSMutableArray    *requests;
@property (nonatomic, retain) ASINetworkQueue   *asiQueue;

- (void)setupAsiQueue;
- (void)setupRequestArray;
- (void)setupBackground;
- (void)setupRequestSuspended;

@end

@implementation PMTRequestQueue

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setupBackground];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [_asiQueue reset];
    [_asiQueue release];
    [_requests release];
    [_requestsSuspended release];
    
    [super dealloc];
    
    NSLog(@"PMTRequestQueue dealloc");
}



#pragma mark - Setup Methods

- (void)setupAsiQueue
{
    if (self.asiQueue == nil)
    {
        ASINetworkQueue *asiQueue = [[ASINetworkQueue alloc] init];
        asiQueue.delegate = self;
        asiQueue.queueDidFinishSelector = @selector(queueDidFinishSelector:);
        self.asiQueue = asiQueue;
        [asiQueue release];
    }
}

- (void)setupRequestArray
{
    if (self.requests == nil)
    {
        NSMutableArray *requests = [[NSMutableArray alloc] init];
        self.requests = requests;
        [requests release];
    }
}

- (void)setupRequestSuspended
{
    if (self.requestsSuspended == nil)
    {
        NSMutableArray *suspend = [[NSMutableArray alloc] init];
        self.requestsSuspended = suspend;
        [suspend release];
    }
}

- (void)setupBackground
{
    if (&UIApplicationDidEnterBackgroundNotification)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    
    if (&UIApplicationWillEnterForegroundNotification)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
}



#pragma mark - Notification Methods

- (void)appDidEnterBackgroundNotification:(NSNotification *)notify 
{
    [self suspendRequests];
}

- (void)appWillEnterForegroundNotification:(NSNotification *)notify 
{
    [self resumeRequests];
}



#pragma mark - Suspend/Resume Methods

- (BOOL)isResumable
{
    return (self.requestsSuspended && [self.requestsSuspended count] > 0);
}

- (void)suspendRequests
{
    [self setupRequestSuspended];
    
    for (PMTRequest *request in self.requests) 
    {
        if (request.asi.isExecuting)
        {
            [request.asi cancel];
            [self.requestsSuspended addObject:request];
            NSLog(@"Request suspended: %@", request.asi.url.absoluteString);
        }
    }
    
    if ([self.requestsSuspended count] > 0 && self.asiQueue)
    {
        self.asiQueue.delegate = nil; // altrimenti scatena il queue finish
        //        [self.asiQueue cancelAllOperations];
    }
}

- (void)resumeRequests
{
    [self setupAsiQueue];
    
    if (self.requestsSuspended)
    {
        self.asiQueue.delegate = self;
        
        for (PMTRequest *request in self.requestsSuspended) 
        {
            ASIHTTPRequest *asi = [request.asi copy];
            request.asi = asi;
            NSLog(@"Request resumed: %@", request.asi.url.absoluteString);
            
            [self.asiQueue addOperation:asi];
            [asi release];
        }
        
        [self.requestsSuspended removeAllObjects];
        [self.asiQueue go];
    }
}



#pragma mark - Core Methods

- (void)addRequest:(PMTRequest *)request
{
    [self setupRequestArray];
    [self setupAsiQueue];
    
    [self.requests addObject:request];
    [self.asiQueue addOperation:request.asi];
}

- (void)startQueue
{
    [self.asiQueue go];
    //[super callDelegate:self.delegate selector:@selector(requestQueueDidStart:) withObject:self];
}

- (void)stopAllRequest
{
    //[self.asiQueue setRequestsCount:0]; FIX-ME!
    [self.asiQueue cancelAllOperations];
    [self.requests removeAllObjects];
}

- (void)reset
{
    NSLog(@"PMTRequestQueue reset");
    
    self.delegate = nil;
    [self.asiQueue reset];
    [self.requestsSuspended removeAllObjects];
    [self.requests removeAllObjects];
}



#pragma mark - ASIHTTPRequestDelegate Methods

- (void)queueDidFinishSelector:(ASINetworkQueue *)queue
{
    NSLog(@"PMTRequestQueue finished");
    
    //[super callDelegate:self.delegate selector:@selector(requestQueueDidFinish:) withObject:self];
    [self.requests removeAllObjects];
}



#pragma mark - Properties

@synthesize requestsSuspended   = _requestsSuspended;
@synthesize requests            = _requests;
@synthesize delegate            = _delegate;
@synthesize asiQueue            = _asiQueue;

@end
