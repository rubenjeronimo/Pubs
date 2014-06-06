//
//  BarTests.m
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BarList.h"

@interface BarTests : XCTestCase

@end

@implementation BarTests

- (void)testCanCreateABarList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertNotNil(allBars, @"");
    XCTAssertEqual(0, [allBars count], @"");
}


- (void)testCanAddABarToTheList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertNotNil(allBars, @"");
    XCTAssertEqual(0, [allBars count], @"");
    
    Bar *mahou = [[Bar alloc] init];
    [allBars addBar:mahou];
    XCTAssertEqual(1, [allBars count], @"");
}

- (void)testInitBarListWithFile {
    BarList *bl = [[BarList alloc] initWithFile:@"bar_list"];
    XCTAssertNotNil(bl, @"");
    
    XCTAssertTrue([bl count] > 1, @"");
    for (Bar *b in [bl allBars]) {
        XCTAssertTrue([b isKindOfClass:[Bar class]], @"");
        XCTAssertNotNil(b.name, @"");
    }
}

- (void)testinitBarWithNameAddressAndPosition {
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:@[@"-3.8730758",@"40.4789826"] forKeys:@[@"longitude", @"latitude"]];
    Bar *bar = [[Bar alloc] initWithName:@"Bar1" andAddress:@"Alli" andPosition:dict];
    XCTAssertEqual(bar.name, @"Bar1", @"");
    XCTAssertEqual(bar.address, @"Alli", @"");
    
    NSString *lon = [bar.position objectForKey:@"longitude"];
    XCTAssertEqual(lon, @"-3.8730758", @"");
    NSString *lat = [bar.position objectForKey:@"latitude"];
    XCTAssertEqual(lat, @"40.4789826", @"");
}
- (void)testCanRemoveABarFromTheList {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertEqual(0, [allBars count], @"");
    
    Bar *mahou = [[Bar alloc] init];
    [allBars addBar:mahou];
    XCTAssertEqual(1, [allBars count], @"");
    [allBars removeBar:mahou];
    XCTAssertEqual(0, [allBars count], @"");
}

- (void)testAllBars {
    BarList *allBars = [[BarList alloc] init];
    XCTAssertTrue([allBars allBars].count == 0, @"");
    
    for (NSUInteger i = 0; i < 10; i++) {
        Bar *b = [[Bar alloc] init];
        [b setName:[NSString stringWithFormat:@"Cerveza %lu", (unsigned long)i]];
        [allBars addBar:b];
    }
    
    for (NSUInteger i = 0; i < 10; i++) {
        Bar *BarToTest = [[allBars allBars] objectAtIndex:i];
        NSString *s = [NSString stringWithFormat:@"Cerveza %lu", (unsigned long)i];
        XCTAssertTrue([BarToTest.name isEqualToString:s], @"");
        NSLog(@"💀 %@ 💀 %@ 💀 %ld", s, BarToTest.name, (unsigned long)i);
    }
    
    
    int i = 0;
    for (Bar *BarToTest in [allBars allBars]) {
        NSString *s = [NSString stringWithFormat:@"Cerveza %lu", (unsigned long)i];
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
