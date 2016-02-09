//
//  ViewController.m
//  HeyzapNativeTestApp
//
//  Created by Sascha Bienert on 03/02/16.
//  Copyright © 2016 Fyber GmbH. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;

@interface ViewController () <GADBannerViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) GADBannerView *banner;

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
    GADAdSize size;
    switch ([self.sizePicker selectedRowInComponent:0]) {
        case 1:
            size = kGADAdSizeLargeBanner;
            break;
        case 2:
            size = kGADAdSizeMediumRectangle;
            break;
        case 3:
            size = kGADAdSizeFullBanner;
            break;
        case 4:
            size = kGADAdSizeLeaderboard;
            break;
        case 5:
            size = kGADAdSizeSkyscraper;
            break;
        case 6:
            size = kGADAdSizeSmartBannerPortrait;
            break;
        case 7:
            size = kGADAdSizeSmartBannerLandscape;
            break;
        case 8:
            size = kGADAdSizeFluid;
            break;

        default:
            size = kGADAdSizeBanner;
            break;
    }

    GADBannerView *adView = [[GADBannerView alloc] init];
    adView.adUnitID = @"ca-app-pub-7693592604401655/1297281726";
    adView.adSize = size;
    adView.delegate = self;
    adView.rootViewController = self;

    GADRequest *request = [GADRequest request];
    request.testDevices = @[ @"Simulator" ];

    [adView loadRequest:request];

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

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 9;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    switch (row) {
        case 1:
            title = @"kGADAdSizeLargeBanner";
            break;
        case 2:
            title = @"kGADAdSizeMediumRectangle";
            break;
        case 3:
            title = @"kGADAdSizeFullBanner";
            break;
        case 4:
            title = @"kGADAdSizeLeaderboard";
            break;
        case 5:
            title = @"kGADAdSizeSkyscraper";
            break;
        case 6:
            title = @"kGADAdSizeSmartBannerPortrait";
            break;
        case 7:
            title = @"kGADAdSizeSmartBannerLandscape";
            break;
        case 8:
            title = @"kGADAdSizeFluid";
            break;

        default:
            title = @"kGADAdSizeBanner";
            break;
    }
    return title;
}

#pragma mark - GADBannerViewDelegate
#pragma mark Ad Request Lifecycle Notifications

/// Tells the delegate that an ad request successfully received an ad. The delegate may want to add
/// the banner view to the view hierarchy if it hasn't been added yet.
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{

}

/// Tells the delegate that an ad request failed. The failure is normally due to network
/// connectivity or ad availablility (i.e., no fill).
- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
{

}

#pragma mark Click-Time Lifecycle Notifications

/// Tells the delegate that a full screen view will be presented in response to the user clicking on
/// an ad. The delegate may want to pause animations and time sensitive interactions.
- (void)adViewWillPresentScreen:(GADBannerView *)bannerView
{

}

/// Tells the delegate that the full screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)bannerView
{

}

/// Tells the delegate that the full screen view has been dismissed. The delegate should restart
/// anything paused while handling adViewWillPresentScreen:.
- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{

}

/// Tells the delegate that the user click will open another app, backgrounding the current
/// application. The standard UIApplicationDelegate methods, like applicationDidEnterBackground:,
/// are called immediately before this method is called.
- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView
{
    
}

@end
