//
//  Stepper.m
//  m7
//
//  Created by Bitey on 11/29/13.
//  Copyright (c) 2013 Bagel Bites. All rights reserved.
//

#import "Stepper.h"

@implementation Stepper

+(BOOL)isStepCountingAvailable{
    if ([CMStepCounter isStepCountingAvailable]) {
        return YES;
    }
    else{
        return NO;
    }
};

-(void)queryStepCountStartingFrom:(NSDate *)start
                               to:(NSDate *)end
                          toQueue:(NSOperationQueue *)queue
                      withHandler:(CMStepQueryHandler)handler{
    if ([CMStepCounter isStepCountingAvailable]) {
        NSLog(@"It worked!");
    }
    else{
        NSLog(@"Not Supported");
    }
}

@end
