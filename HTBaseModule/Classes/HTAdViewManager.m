//
//  HTAdViewManager.m
//  HTHomeModule
//
//  Created by 李雪健 on 2023/7/31.
//

#import "HTAdViewManager.h"

@interface HTAdViewManager ()

@end

@implementation HTAdViewManager

+ (HTAdView *)lgjeropj_bannerView {
    
    HTAdView *view = [[NSClassFromString(@"HTAdvertBannerView") alloc] init];
    return view;
}

+ (HTAdView *)lgjeropj_mrecView {
    
    HTAdView *view = [[NSClassFromString(@"HTAdvertisementView") alloc] init];
    return view;
}

+ (HTAdViewManager *)lgjeropj_rewardAd {
    
    HTAdViewManager *view = [[NSClassFromString(@"HTRewardAdManager") alloc] init];
    return view;
}

- (BOOL)lgjeropj_ready {
    return NO;
}
- (void)lgjeropj_loadAd {}
- (void)lgjeropj_showRewardAd {}
- (void)lgjeropj_clearAd {}

@end
