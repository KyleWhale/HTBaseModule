//
//  HTDeepLinkManager.m
//  WillDrawApp
//
//  Created by 李雪健 on 2023/1/4.
//

#import "HTDeepLinkManager.h"
#import "LKFPrivateFunction.h"
#import "HTCommonMacro.h"
#import "HTCommonConfiguration.h"

@import FirebaseDynamicLinks;
@implementation HTDeepLinkManager

+ (NSURL *)lgjeropj_deepLinkWith:(NSDictionary *)dic {
    
    // 深链离开
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_dynamicLeave"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // 公参
    NSMutableDictionary *var_dict = [NSMutableDictionary dictionaryWithDictionary:[self lgjeropj_publicParams]];
    // 传参
    [var_dict addEntriesFromDictionary:dic];
    // 移除多余的参数内容
    [var_dict removeObjectForKey:@"var_shopLink"];
    [var_dict removeObjectForKey:@"var_targetLink"];
    [var_dict removeObjectForKey:@"var_targetBundle"];
    [var_dict removeObjectForKey:@"var_dynamicK2"];
    [var_dict removeObjectForKey:@"var_dynamicC1"];
    [var_dict removeObjectForKey:@"var_dynamicC2"];
    [var_dict removeObjectForKey:@"var_dynamicC4"];
    [var_dict removeObjectForKey:@"var_dynamicC5"];
    [var_dict removeObjectForKey:@"var_dynamicLogo"];
    // 转json
    NSString *var_params = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:var_dict options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    // 拼接到params
    NSString *var_paramsString = [NSString stringWithFormat:@"%@%@%@", dic[@"var_shopLink"], AsciiString(@"?params="), var_params];
    // 防止URL转化不成功
    var_paramsString = [var_paramsString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    // link为实际获取到的链接
    NSURL *var_link = [[NSURL alloc] initWithString:var_paramsString];
    // 转化给firebase
    FIRDynamicLinkComponents *var_linkBuilder = [[FIRDynamicLinkComponents alloc] initWithLink:var_link domainURIPrefix:dic[@"var_targetLink"]];
    var_linkBuilder.iOSParameters = [[FIRDynamicLinkIOSParameters alloc] initWithBundleID:dic[@"var_targetBundle"]];
    var_linkBuilder.navigationInfoParameters = [[FIRDynamicLinkNavigationInfoParameters alloc] init];
    if ([dic[@"var_dynamicK2"] intValue] == 1) {
        var_linkBuilder.navigationInfoParameters.forcedRedirectEnabled = YES;
    } else {
        var_linkBuilder.navigationInfoParameters.forcedRedirectEnabled = NO;
        var_linkBuilder.socialMetaTagParameters = [[FIRDynamicLinkSocialMetaTagParameters alloc] init];
        if ([dic[AsciiString(@"type")] isEqualToString:@"3"]) {
            var_linkBuilder.socialMetaTagParameters.title = dic[@"var_dynamicC1"] ?: @"";
            var_linkBuilder.socialMetaTagParameters.descriptionText = dic[@"var_dynamicC2"] ?: @"";
        } else {
            var_linkBuilder.socialMetaTagParameters.title = dic[@"var_dynamicC4"] ?: @"";
            var_linkBuilder.socialMetaTagParameters.descriptionText = dic[@"var_dynamicC5"] ?: @"";
        }
        if (dic[@"var_dynamicLogo"]) {
            var_linkBuilder.socialMetaTagParameters.imageURL = [NSURL URLWithString:dic[@"var_dynamicLogo"]];
        }
    }
    [UIPasteboard generalPasteboard].string = var_linkBuilder.url.absoluteString;
    return var_linkBuilder.url;
}

+ (NSDictionary *)lgjeropj_publicParams {
    NSMutableDictionary *var_dic = [[NSMutableDictionary alloc] init];
    // appName
    [var_dic setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:AsciiString(@"CFBundleDisplayName")] forKey:AsciiString(@"appname")];
    // appLink
    NSDictionary *var_airDict = [HTCommonConfiguration lgjeropj_shared].BLOCK_airDictBlock();
    [var_dic setValue:[var_airDict objectForKey:AsciiString(@"l2")] ?: @"" forKey:AsciiString(@"applink")];
    // bundleId
    [var_dic setValue:[[NSBundle mainBundle] bundleIdentifier] forKey:AsciiString(@"appbundleid")];
    // appleId
    [var_dic setValue:[HTCommonConfiguration lgjeropj_shared].BLOCK_appleIdBlock() forKey:AsciiString(@"appleid")];
    // force
    [var_dic setValue:@"1" forKey:AsciiString(@"force")];
    // uid
    [var_dic setValue:[HTCommonConfiguration lgjeropj_shared].BLOCK_uidBlock() forKey:AsciiString(@"uid")];
    // userName
    [var_dic setValue:[HTCommonConfiguration lgjeropj_shared].BLOCK_userNameBlock() forKey:AsciiString(@"userName")];
    // appId
    [var_dic setValue:[HTCommonConfiguration lgjeropj_shared].BLOCK_appIdBlock() forKey:AsciiString(@"appid")];
    // appType
    [var_dic setValue:@"" forKey:AsciiString(@"appType")];
    // 设备id
    [var_dic setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:AsciiString(@"deviceNo")];
    // vip
    [var_dic setValue:@([HTCommonConfiguration lgjeropj_shared].BLOCK_vipBlock()).stringValue forKey:AsciiString(@"vip")];

    return var_dic;
}

@end
