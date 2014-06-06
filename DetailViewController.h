//
//  DetailViewController.h
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bar.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Bar *bar;

- (IBAction)backButton:(id)sender;

@end
