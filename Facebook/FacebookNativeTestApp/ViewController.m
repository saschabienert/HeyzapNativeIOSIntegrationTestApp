//
//  ViewController.m
//  HeyzapNativeTestApp
//
//  Created by Sascha Bienert on 03/02/16.
//  Copyright © 2016 Fyber GmbH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self releaseBanner];
}

- (IBAction)startSDK:(id)sender {
}

- (IBAction)showBannerOnTop:(id)sender {
}

- (IBAction)showBannerOnBottom:(id)sender {
}

- (IBAction)showBannerInCustomView:(id)sender {
    [self getBanner];
}

- (IBAction)destroyBanner:(id)sender {
    [self releaseBanner];
}

- (void)getBanner {
}

- (void)releaseBanner {
}

@end
