//
//  ViewController.m
//  CircleAnimationView
//
//  Created by 陈爱彬 on 15/3/10.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import "ViewController.h"
#import "CircleAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CircleAnimationView *animationView = [[CircleAnimationView alloc] initWithFrame:CGRectMake(150, 200, 24, 24)];
    animationView.circleType = CircleTypeRing;
    [self.view addSubview:animationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
