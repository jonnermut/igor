//
//  AKindOfClassSelector.m
//  igor
//
//  Created by Dale Emery on 11/17/11.
//  Copyright (c) 2011 Dale H. Emery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KindOfClassMatcher.h"

@interface KindOfClassMatcherTests : SenTestCase
@end

@implementation KindOfClassMatcherTests {
    CGRect frame;
}

-(void) setUp {
    frame = CGRectMake(0, 0, 100, 100);
}

-(void) testMatchesAViewOfTheTargetClass {
    id<Matcher> buttonSelector = [[KindOfClassMatcher alloc] initWithTargetClass:[UIButton class]];
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    STAssertTrue([buttonSelector matchesView:button], @"Matches the target class");
}

- (void)testMismatchesAViewOfANonTargetClass {
    id<Matcher> buttonSelector = [[KindOfClassMatcher alloc] initWithTargetClass:[UIButton class]];
    UIView* view = [[UIView alloc] initWithFrame:frame];
    STAssertFalse([buttonSelector matchesView:view], @"Mismatches a non-target class");
}

- (void)testMatchesAViewOfAClassThatInheritsFromTheTargetClass {
    id<Matcher> viewSelector = [[KindOfClassMatcher alloc] initWithTargetClass:[UIView class]];
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    STAssertTrue([viewSelector matchesView:button], @"Matches a derived class");
}

@end