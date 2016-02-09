//
//  ViewController.m
//  HeyzapNativeTestApp
//
//  Created by Sascha Bienert on 03/02/16.
//  Copyright © 2016 Fyber GmbH. All rights reserved.
//

#import "ViewController.h"
@import FBAudienceNetwork;

@interface ViewController () <FBAdViewDelegate>

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
    [adView setDelegate:self];
    [adView loadAd];

    [self releaseBanner];
    self.banner = adView;
    [self.banner setFrame:CGRectMake(0, 0, self.bannerContainerView.frame.size.width, self.bannerContainerView.frame.size.height)];
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

#pragma mark - FBAdViewDelegate

- (void)adView:(FBAdView *)adView didFailWithError:(NSError *)error;
{
    NSLog(@"[FBAdViewDelegate] Ad failed to load");
}

- (void)adViewDidLoad:(FBAdView *)adView;
{
    NSLog(@"[FBAdViewDelegate] Ad was loaded and ready to be displayed");
}

- (void)adViewDidClick:(FBAdView *)adView
{
    NSLog(@"[FBAdViewDelegate] The user clicked on the ad and will be taken to its destination.");
}

- (void)adViewDidFinishHandlingClick:(FBAdView *)adView
{
    NSLog(@"[FBAdViewDelegate] The user finished to interact with the ad.");
}

- (void)adViewWillLogImpression:(nonnull FBAdView *)adView
{
    NSLog(@"[FBAdViewDelegate] The ad view will log an impression.");
}

- (UIViewController *)viewControllerForPresentingModalView
{
    NSLog(@"[FBAdViewDelegate] The Facebook banner ad asks for viewControllerForPresentingModalView.");
    return self;
}

@end
