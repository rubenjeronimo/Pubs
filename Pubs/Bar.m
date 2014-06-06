//
//  Bar.m
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "Bar.h"


@implementation Bar

- (id)init {
    self = [self initWithName:@"" andAddress:@"" andPosition:[[NSDictionary alloc] init]];
    
    return self;
}

- (id)initWithName:(NSString *)name {
    self = [self initWithName:name andAddress:@"" andPosition:[[NSDictionary alloc] init]];
    
    return self;
}

- (id)initWithName:(NSString *)name andAddress:(NSString *)address {
    self = [self initWithName:name andAddress:address andPosition:[[NSDictionary alloc] init]];
    
    return self;
}

// DESIGNATED INITIALIZER (ES EL UNICO QUE LLAMA A SUPER)

- (id)initWithName:(NSString *)name andAddress:(NSString *)address andPosition:(NSDictionary *)position {
    self = [super init];
    
    if (self) {
        _name = name;
        _address = address;
        _position = position;
    }
    
    return self;
}

@end
