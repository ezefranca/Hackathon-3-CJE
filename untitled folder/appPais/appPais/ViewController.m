//
//  ViewController.m
//  appPais
//
//  Created by Ezequiel Franca dos Santos on 20/09/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "ViewController.h"
#import "UIComboBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIComboBox *new = [[UIComboBox alloc]init];
    [self.view addSubview:new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
