//
//  Stepper.h
//  m7
//
//  Created by Bitey on 11/29/13.
//  Copyright (c) 2013 Bagel Bites. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface Stepper : CMStepCounter

+(BOOL)isStepCountingAvailable;
-(void)queryStepCountStartingFrom:(NSDate *)start to:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMStepQueryHandler)handler;

@end
