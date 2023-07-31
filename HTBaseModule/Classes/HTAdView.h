//
//  HTAdView.h
//  HTHomeModule
//
//  Created by 李雪健 on 2023/7/31.
//

#import "BaseView.h"
#import "HTCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTAdView : BaseView

@property (nonatomic, copy) BLOCK_dataBlock   cancelBlock;

// mrec
@property (nonatomic, copy) BLOCK_dataBlock   adStartBlock;
@property (nonatomic, assign) BOOL   var_isShowCancel;

- (void)ht_showAd;

// banner
@property (nonatomic, copy) BLOCK_HTVoidBlock var_didLoadBlock;
@property (nonatomic, assign) BOOL var_isLoaded;

- (void)lgjeropj_onClearAction;;

@end

NS_ASSUME_NONNULL_END
