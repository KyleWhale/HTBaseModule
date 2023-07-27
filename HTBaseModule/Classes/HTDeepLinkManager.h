//
//  HTDeepLinkManager.h
//  WillDrawApp
//
//  Created by 李雪健 on 2023/1/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTDeepLinkManager : NSObject

// 传入参数 var_shopLink var_targetBundle var_targetLink
// 公参包括 "appname", "applink", "appbundleid", "appleid", "force", "uid"
+ (NSURL *)lgjeropj_deepLinkWith:(NSDictionary *)dic;
+ (NSDictionary *)lgjeropj_publicParams;

@end

NS_ASSUME_NONNULL_END
