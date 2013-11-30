//
//  ViewController.m
//  m7
//
//  Created by Bitey on 11/29/13.
//  Copyright (c) 2013 Bagel Bites. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSDate *sevenDaysAgo;
@property (strong, nonatomic) NSDate *today;
@property (strong, nonatomic) NSNumber *steps;
@property (strong, nonatomic) NSNumber *totalCurrentStepsTaken;
@property (strong, nonatomic) NSNumber * stepsNotTakenToday;
@property (strong, nonatomic) NSMutableArray *stepsTakenInOneWeek;
@property (strong, nonatomic) NSMutableArray *convertedStepsArray;

@property (weak, nonatomic) IBOutlet UILabel *todaysStepOutlet;
@property (weak, nonatomic) IBOutlet UILabel *oneDayAgoOutlet;
@property (weak, nonatomic) IBOutlet UILabel *twoDaysAgoOutlet;
@property (weak, nonatomic) IBOutlet UILabel *threeDaysAgoOutlet;
@property (weak, nonatomic) IBOutlet UILabel *fourDaysAgoOutlet;
@property (weak, nonatomic) IBOutlet UILabel *fiveDaysAgoOutlet;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *today = [[NSDate alloc]init];
    self.stepsTakenInOneWeek = [[NSMutableArray alloc] init];
    self.Stepper = [[CMStepCounter alloc] init];

    today = [NSDate date];
    
    for (int i = 0; i < 7; i++) {
        NSDate *oneDayAgo = [[NSDate alloc]initWithTimeInterval:-(1+i)*(24*60*60) sinceDate:today];
        [self.Stepper queryStepCountStartingFrom:oneDayAgo
                                              to:today
                                         toQueue:[NSOperationQueue mainQueue]
                                     withHandler:^(NSInteger numberOfSteps, NSError *error)
         {
             //
             //Get number of steps in an interval
             //
             self.steps = [NSNumber numberWithLong:numberOfSteps];
            [self.stepsTakenInOneWeek addObject:self.steps];
             
             
             if (i == 6) {
                 [self displayStepsTaken:[self subtractSteps:self.stepsTakenInOneWeek]];
             }
         }];
    }
}

-(NSMutableArray*)subtractSteps:(NSMutableArray*)incomingStepArray
{
    self.convertedStepsArray = [[NSMutableArray alloc] init];
    
    NSLog(@"%lu", (unsigned long)incomingStepArray.count);
    
    for (int i = 0; i < incomingStepArray.count; i++) {
        if (i > 0) {
            [self.convertedStepsArray addObject:[NSNumber numberWithDouble:[[incomingStepArray objectAtIndex:i] doubleValue] - [[incomingStepArray objectAtIndex:i-1] doubleValue]]];
        }
        else{
            [self.convertedStepsArray addObject:[incomingStepArray objectAtIndex:i]];
        }
    }
    
    
    return self.convertedStepsArray;
}

-(void)displayStepsTaken:(NSMutableArray*)stepsTaken
{
    
    self.todaysStepOutlet.text = [NSString stringWithFormat:@"%@ steps today", [stepsTaken objectAtIndex:0]];
    self.oneDayAgoOutlet.text = [NSString stringWithFormat:@"%@ steps yesterday", [stepsTaken objectAtIndex:1]];
    self.twoDaysAgoOutlet.text = [NSString stringWithFormat:@"%@ steps two days ago", [stepsTaken objectAtIndex:2]];
    self.threeDaysAgoOutlet.text = [NSString stringWithFormat:@"%@ steps three days ago", [stepsTaken objectAtIndex:3]];
    self.fourDaysAgoOutlet.text = [NSString stringWithFormat:@"%@ steps four days ago", [stepsTaken objectAtIndex:4]];
    self.fiveDaysAgoOutlet.text = [NSString stringWithFormat:@"%@ steps five days ago", [stepsTaken objectAtIndex:5]];
    //self.sixDaysAgoOutlet.text = [NSString stringWithFormat:@"%@ steps six days ago", [stepsTaken objectAtIndex:6]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
