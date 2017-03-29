//
//  ViewController.m
//  SingletonDemo1
//
//  Created by Jony on 17/3/29.
//  Copyright © 2017年 yavatop. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MitchellTool *temp1 = [[MitchellTool alloc] init];
    MitchellTool *temp2 = [MitchellTool defaultManager];
    MitchellTool *temp3 = [MitchellTool copy];
    MitchellTool *temp4 = [MitchellTool mutableCopy];
    NSLog(@"temp1: %@",temp1);
    NSLog(@"temp2: %@",temp2);
    NSLog(@"temp3: %@",temp3);
    NSLog(@"temp4: %@",temp4);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
