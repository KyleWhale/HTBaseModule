//
//  HTCommonConfiguration.h
//  PostTest
//
//  Created by 李雪健 on 2023/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTCommonConfiguration : NSObject

+ (HTCommonConfiguration *)lgjeropj_shared;

// vip状态
@property (nonatomic, copy) BOOL (^BLOCK_vipBlock) (void);
// baseURL
@property (nonatomic, copy) NSString * (^BLOCK_baseURLBlock) (void);
// 埋点URL
@property (nonatomic, copy) NSString * (^BLOCK_dataURLBlock) (void);
// app_id
@property (nonatomic, copy) NSString * (^BLOCK_appIdBlock) (void);
// appleId
@property (nonatomic, copy) NSString * (^BLOCK_appleIdBlock) (void);
// uid
@property (nonatomic, copy) NSString * (^BLOCK_uidBlock) (void);
// userName
@property (nonatomic, copy) NSString * (^BLOCK_userNameBlock) (void);
// airDict
@property (nonatomic, copy) NSDictionary * (^BLOCK_airDictBlock) (void);
// 多语言
@property (nonatomic, copy) NSDictionary * (^BLOCK_mutilLanguageBlock) (void);

@end

NS_ASSUME_NONNULL_END
