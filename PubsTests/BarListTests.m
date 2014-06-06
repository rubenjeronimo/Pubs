//
//  BarListTests.m
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BarList.h"

@interface BarListTests : XCTestCase

@end

@implementation BarListTests

- (void)testCanCreateABarList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertNotNil(allBars, @"");
    XCTAssertEqual(0, [allBars count], @"");
}



- (void)testCanAddABarToTheList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertNotNil(allBars, @"");
    XCTAssertEqual(0, [allBars count], @"");
    
    Bar *pepe = [[Bar alloc] init];
    [allBars addBar:pepe];
    XCTAssertEqual(1, [allBars count], @"");
}



- (void)testCanRemoveABarFromTheList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertEqual(0, [allBars count], @"");
    
    Bar *pepe = [[Bar alloc] init];
    [allBars addBar:pepe];
    XCTAssertEqual(1, [allBars count], @"");
    [allBars removeBar:pepe];
    XCTAssertEqual(0, [allBars count], @"");
}



- (void)testallBars {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertTrue([allBars allBars].count == 0, @"");
    
    for (NSUInteger i = 0; i < 10; i++) {
        Bar *b = [[Bar alloc] init];
        [b setName:[NSString stringWithFormat:@"Bar%lu", (unsigned long)i]];
        [allBars addBar:b];
    }
    
    for (NSUInteger i = 0; i < 10; i++) {
        Bar *BarToTest = [[allBars allBars] objectAtIndex:i];
        NSString *s = [NSString stringWithFormat:@"Bar%lu", (unsigned long)i];
        XCTAssertTrue([BarToTest.name isEqualToString:s], @"");
        NSLog(@"💀 %@ 💀 %@ 💀 %ld", s, BarToTest.name, (unsigned long)i);
    }
    
    
    int i = 0;
    for (Bar *BarToTest in [allBars allBars]) {
        NSString *s = [NSString stringWithFormat:@"Bar%lu", (unsigned long)i];
        XCTAssertTrue([BarToTest.name isEqualToString:s], @"");
        NSLog(@"💀 %@ 💀 %@ 💀 %ld", s, BarToTest.name, (unsigned long)i);
        i++;
    }
    
    [[allBars allBars] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Bar *BarToTest = (Bar *)obj;
        NSLog(@"%@ %lu", BarToTest.name, (unsigned long)idx);
        *stop = idx > 50 ? YES : NO;
    }];
    
}


- (void)testCountBars {
    BarList *allBars = [[BarList alloc] init];
    Bar *mahou = [[Bar alloc] init];
    [allBars addBar:mahou];
    [allBars addBar:mahou];
    [allBars addBar:mahou];
    [allBars addBar:mahou];
    XCTAssertTrue([allBars count] == 4, @"");
}


- (void)testCantChangeCountOfBars {
    BarList *allBars = [[BarList alloc] init];
    //allBars.count = 50;
    XCTAssertTrue(allBars.count != 50, @"");
}


@end
