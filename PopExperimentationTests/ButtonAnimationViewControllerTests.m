//
//  ButtonAnimationViewControllerTests.m
//  PopExperimentation
//
//  Created by William Archimede on 24/10/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "PopExperimentationTests-Swift.h"

@interface ButtonAnimationViewControllerTests : XCTestCase

@property (strong, nonatomic) UIStoryboard *mainStoryboard;
@property (strong, nonatomic) ButtonAnimationViewController *sut;

@end

@implementation ButtonAnimationViewControllerTests

- (void)setUp {
    self.mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCTAssertNotNil(self.mainStoryboard);
    
    self.sut = [self.mainStoryboard instantiateViewControllerWithIdentifier:@"ButtonAnimationViewController"];
    XCTAssertNotNil(self.sut);
    
    [self.sut loadView];
}

- (void)tearDown {
    self.mainStoryboard = nil;
    self.sut = nil;
}

- (void)testButtonShouldBeConnected {
    XCTAssertNotNil(self.sut.button);
}

- (void)testButtonActionAnimateScaleToFatWhenTouchDownShouldBeConnected {
    NSArray *actions = [self.sut.button actionsForTarget:self.sut forControlEvent:UIControlEventTouchDown];
    XCTAssert([actions containsObject:@"animateScaleToFatWhenTouchDown:"]);
}

- (void)testButtonActionAnimateScaleWithSpringToDefaultWhenTouchUpInside {
    NSArray *actions = [self.sut.button actionsForTarget:self.sut forControlEvent:UIControlEventTouchUpInside];
    XCTAssert([actions containsObject:@"animateScaleWithSpringToDefaultWhenTouchUpInside:"]);
}

- (void)testButtonActionAnimateShakeAfterDelayWhenTouchUpInside {
    NSArray *actions = [self.sut.button actionsForTarget:self.sut forControlEvent:UIControlEventTouchUpInside];
    XCTAssert([actions containsObject:@"animateShakeAfterDelayWhenTouchUpInside:"]);
}

@end
