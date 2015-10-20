//
//  ViewController.m
//  AutolayoutHelperExample
//
//  Created by Chandler De Angelis on 10/20/15.
//  Copyright © 2015 Chandler De Angelis. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutolayoutView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *red = [UIView autolayoutView];
    [red setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:red];
    [red addWidthAndHeightConstraints:200.0];
    [red alignAxisToSuperviewAxis:NSLayoutAttributeCenterX];
    [red alignAxisToSuperviewAxis:NSLayoutAttributeCenterY];
    
    UIView *blue = [UIView autolayoutView];
    [blue setBackgroundColor:[UIColor blueColor]];
    [red addSubview:blue];
    [blue pinToAllSidesOfParent];
}


@end
