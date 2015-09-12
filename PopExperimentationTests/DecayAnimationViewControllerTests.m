//
//  DecayAnimationViewControllerTests.m
//  PopExperimentation
//
//  Created by William Archimede on 24/10/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "PopExperimentationTests-Swift.h"

@interface DecayAnimationViewControllerTests : XCTestCase

@end

@implementation DecayAnimationViewControllerTests

- (void)testViewToAnimateShouldBeConnected {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCTAssertNotNil(mainStoryboard);
    
    DecayAnimationViewController *sut = [mainStoryboard instantiateViewControllerWithIdentifier:@"DecayAnimationViewController"];
    XCTAssertNotNil(sut);
    
    [sut loadView];
    
    XCTAssertNotNil(sut.viewToAnimate);
}

- (void)testViewToAnimateShoudHaveAPanGestureRecognizer {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCTAssertNotNil(mainStoryboard);
    
    DecayAnimationViewController *sut = [mainStoryboard instantiateViewControllerWithIdentifier:@"DecayAnimationViewController"];
    XCTAssertNotNil(sut);
    
    [sut loadView];
    
    XCTAssertEqual(sut.viewToAnimate.gestureRecognizers.count, 1);
    XCTAssert([sut.viewToAnimate.gestureRecognizers.firstObject isKindOfClass:[UIPanGestureRecognizer class]]);
}

@end
