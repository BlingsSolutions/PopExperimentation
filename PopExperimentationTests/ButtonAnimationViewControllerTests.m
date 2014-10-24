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

@end

@implementation ButtonAnimationViewControllerTests

- (void)testButtonShouldBeConnected {
    // given
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCTAssertNotNil(mainStoryboard);
    
    ButtonAnimationViewController *sut = [mainStoryboard instantiateViewControllerWithIdentifier:@"ButtonAnimationViewController"];
    XCTAssertNotNil(sut);
    
    // when
    [sut loadView];
    
    // then
    XCTAssertNotNil(sut.button);
}

@end
