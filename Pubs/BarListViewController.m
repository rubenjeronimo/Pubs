//
//  BarListViewController.m
//  Pubs
//
//  Created by Jose A. Herran on 06/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "BarListViewController.h"
#import "DetailViewController.h"
#import "BarList.h"
#import <StarRatingView.h>

@interface BarListViewController ()

@property (nonatomic, strong) BarList *barList;
@property (nonatomic, strong) Bar *currentBar;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *rate;

@property (weak, nonatomic) IBOutlet StarRatingView *ratingStars;


@end

@implementation BarListViewController

- (IBAction)changeBar:(id)sender {
    UIButton *b = sender;
    if (b.tag) {
        // right button
        self.currentBar = [self.barList nextBar];
        self.name.text = self.currentBar.name;
        self.address.text = self.currentBar.address;
        self.rate.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.currentBar.rate];
        
        NSURL *theUrl = [NSURL URLWithString:self.currentBar.photoUrl];
        NSData *data = [NSData dataWithContentsOfURL:theUrl];
        UIImage *downImage = [UIImage imageWithData:data];
        self.image.image = downImage;

        [self.ratingStars displayRating:self.currentBar.rate];
        
    } else {
        //left button
        self.currentBar = [self.barList prevBar];
        self.name.text = self.currentBar.name;
        self.address.text = self.currentBar.address;
        self.rate.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.currentBar.rate];

        NSURL *theUrl = [NSURL URLWithString:self.currentBar.photoUrl];
        NSData *data = [NSData dataWithContentsOfURL:theUrl];
        UIImage *downImage = [UIImage imageWithData:data];
        self.image.image = downImage;

        [self.ratingStars displayRating:self.currentBar.rate];
    }
    
}

- (IBAction)buttonDescription:(id)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    Bar *currentBar = [[Bar alloc]init];
    currentBar = [[self.barList allBars] objectAtIndex:0];
    self.name.text = currentBar.name;
    self.address.text = currentBar.address;
    self.rate.text = [NSString stringWithFormat:@"%lu", (unsigned long)currentBar.rate];
    
    NSURL *theUrl = [NSURL URLWithString:currentBar.photoUrl];
    NSData *data = [NSData dataWithContentsOfURL:theUrl];
    UIImage *downImage = [UIImage imageWithData:data];
    self.image.image = downImage;
    
    self.ratingStars.fullImage = @"ic_starred.png";
    self.ratingStars.emptyImage = @"ic_starredept.png";

    [self.ratingStars displayRating:currentBar.rate];
}


- (BarList *)barList {
    if (!_barList) {
        _barList = [[BarList alloc] initWithFile:@"bar_list"];
    }
    return _barList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetailViewController"])
    {
        // Get reference to the destination view controller
        DetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setBar:self.currentBar];
    }
}

@end
