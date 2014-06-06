//
//  BarList.h
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar.h"

@interface BarList : NSObject

@property (nonatomic, readonly) NSUInteger count;


- (void)addBar:(Bar *)bar;
- (void)removeBar:(Bar *)bar;
- (NSUInteger)count;
- (NSArray *)allBars;
- (id)initWithFile:(NSString *)fileName;

@end
