//
//  ViewController.m
//  HeyzapNativeTestApp
//
//  Created by Sascha Bienert on 03/02/16.
//  Copyright © 2016 Fyber GmbH. All rights reserved.
//

#import "ViewController.h"
#import <HeyzapAds/HeyzapAds.h>

@interface ViewController ()

@property (weak, nonatomic) HZBannerAd *banner;

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
    [HeyzapAds startWithPublisherID:@"7b162b3f5f5a527f26eed72406b3212f"];
}

- (IBAction)showMediation:(id)sender {
    [HeyzapAds presentMediationDebugViewController];
}

- (IBAction)showBannerOnTop:(id)sender {
    [self showBanner:HZBannerPositionTop];
}

- (IBAction)showBannerOnBottom:(id)sender {
    [self showBanner:HZBannerPositionBottom];
}

- (IBAction)showBannerInCustomView:(id)sender {
    [self getBanner];
}

- (IBAction)destroyBanner:(id)sender {
    [self releaseBanner];
}

- (void)showBanner:(HZBannerPosition)position {
    [HZBannerAd placeBannerInView:self.view
                         position:position
                          options:[[HZBannerAdOptions alloc] init]
                          success:^(HZBannerAd *banner) {
                              [self releaseBanner];
                              self.banner = banner;
                          } failure:^(NSError *error) {
                              NSLog(@"Error = %@",error);
                          }];
}

- (void)getBanner {
    [HZBannerAd requestBannerWithOptions:[[HZBannerAdOptions alloc] init]
                                 success:^(HZBannerAd *banner) {
                                     [self releaseBanner];
                                     self.banner = banner;
                                     [self.bannerContainerView addSubview:banner];
                                 }
                                 failure:^(NSError *error) {
                                     NSLog(@"Error = %@",error);
                                 }];
}

- (void)releaseBanner {
    [self.banner removeFromSuperview];
    self.banner = nil;
}

@end
