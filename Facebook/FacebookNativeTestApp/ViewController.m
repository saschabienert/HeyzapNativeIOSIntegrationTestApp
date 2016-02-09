//
//  ViewController.m
//  HeyzapNativeTestApp
//
//  Created by Sascha Bienert on 03/02/16.
//  Copyright © 2016 Fyber GmbH. All rights reserved.
//

#import "ViewController.h"
@import FBAudienceNetwork;

@interface ViewController ()

@property (weak, nonatomic) FBAdView *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.bannerContainerView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self releaseBanner];
}

- (IBAction)loadBanner:(id)sender {
        FBAdView *adView = [[FBAdView alloc] initWithPlacementID:@"660126697415740_973155002779573"
                                                          adSize:kFBAdSizeHeight50Banner
                                              rootViewController:self];
        [adView loadAd];

        [self releaseBanner];
        self.banner = adView;
        [self.bannerContainerView addSubview:self.banner];
}

- (IBAction)showBanner:(id)sender {
    [self.bannerContainerView setHidden:NO];
}

- (IBAction)hideBanner:(id)sender {
    [self.bannerContainerView setHidden:YES];
}

- (IBAction)destroyBanner:(id)sender {
    [self releaseBanner];
}

- (void)releaseBanner {
    [self.banner removeFromSuperview];
    self.banner = nil;
}

@end
