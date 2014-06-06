//
//  BarList.m
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "BarList.h"

@interface BarList ()

@property (nonatomic, strong) NSMutableArray *theList;
@property NSInteger idBar;

@end


@implementation BarList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _theList = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addBar:(Bar *)Bar {
    [self.theList addObject:Bar];
}

- (void)removeBar:(Bar *)Bar {
    [self.theList removeObject:Bar];
}

- (NSUInteger)count {
    return [self.theList count];
}

- (NSArray *)allBars {
    return self.theList;
}

- (id)initWithFile:(NSString *)fileName {
    // self init instead of super init, because we call to designated initializer
    self = [self init];
    if (self) {
        NSString *fileNameAndPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:fileNameAndPath];
        for (NSDictionary *dict in array) {
            Bar *bar = [[Bar alloc] init];
            bar.name = [dict objectForKey:@"name"];
            bar.address = [dict objectForKey:@"adress"];
            bar.position = [dict objectForKey:@"position"];
            bar.photoUrl = [dict objectForKey:@"photoUrl"];
            bar.rate = [[dict objectForKey:@"rate"] integerValue];
            [_theList addObject:bar];
        }
    }
    return self;
}


- (Bar *)nextBar {
    self.barNumber++;
    NSLog(@"%ld", (long)self.barNumber);

    
    if (self.barNumber < [self.allBars count]) {
        return [self.allBars objectAtIndex:self.barNumber];
        
    } else {
        self.barNumber = 0;
        
        return [self.allBars objectAtIndex:0];
    }
    
    
}

- (Bar *) prevBar{
    self.barNumber--;
    NSLog(@"%ld", (long)self.barNumber);
    if (self.barNumber < 0) {
        self.barNumber = [self.allBars count] - 1;
        return [self.allBars objectAtIndex:[self.allBars count] - 1];
    }else{
        return [self.allBars objectAtIndex:self.barNumber];
    }
}

@end
