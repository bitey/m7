//
//  ViewController.h
//  m7
//
//  Created by Bitey on 11/29/13.
//  Copyright (c) 2013 Bagel Bites. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface ViewController : UIViewController

@property (strong, nonatomic) CMStepCounter *Stepper;

-(void)displayStepsTaken:(NSMutableArray*)stepsTaken;
-(NSMutableArray*)subtractSteps:(NSMutableArray*)incomingStepArray;
@end
