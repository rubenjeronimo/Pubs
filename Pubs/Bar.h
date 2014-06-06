//
//  Bar.h
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic) NSUInteger rate;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDictionary *position;
@property (nonatomic, strong) NSString *photoUrl;


- (id)init; // overwrite
- (id)initWithName:(NSString *)name;
- (id)initWithName:(NSString *)name andAddress:(NSString *)address;
- (id)initWithName:(NSString *)name andAddress:(NSString *)address andPosition:(NSDictionary *)position;

@end
