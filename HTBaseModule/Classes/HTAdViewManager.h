//
//  HTAdViewManager.h
//  HTHomeModule
//
//  Created by 李雪健 on 2023/7/31.
//

#import <Foundation/Foundation.h>
#import "HTAdView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTAdViewManager : NSObject

+ (HTAdView *)lgjeropj_bannerView;

+ (HTAdView *)lgjeropj_mrecView;

+ (HTAdViewManager *)lgjeropj_rewardAd;

// reward
@property (nonatomic, copy) void (^BLOCK_didDisplayBlock) (void);
@property (nonatomic, copy) void (^BLOCK_didHiddenBlock) (NSString *identifier);

- (BOOL)lgjeropj_ready;
- (void)lgjeropj_loadAd;
- (void)lgjeropj_showRewardAd;
- (void)lgjeropj_clearAd;

@end

NS_ASSUME_NONNULL_END
