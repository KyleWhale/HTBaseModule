//
//  HTCommonMacro.h
//  PostTest
//
//  Created by 李雪健 on 2023/7/27.
//

#ifndef HTCommonMacro_h
#define HTCommonMacro_h

#define AsciiString(object) [LKFPrivateFunction lgjeropj_stringFromAsciiArray:object]
#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define HTPingFangFont(var_font) [UIFont systemFontOfSize:var_font weight:UIFontWeightMedium]
#define HTPingFangRegularFont(var_font) [UIFont systemFontOfSize:var_font weight:UIFontWeightRegular]
#define isIPhoneX_X_orMore kStatusHeight > 20
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define REAL_WIDTH      ((kScreenWidth < kScreenHeight) ?kScreenWidth :kScreenHeight)
#define REAL_HEIGHT     ((kScreenWidth < kScreenHeight) ?kScreenHeight :kScreenWidth)
#define kScale  (kScreenWidth / 375.0)
#define kWidthScale(a)                  (isPad ? 1 : (REAL_WIDTH / 375))*(a)
#define kStatusHeight  [UIDevice statusBarHeight]
#define kNavBarHeight  (kStatusHeight +  44.f)
#define TabBarHeight                        [UIDevice tabbarHeight]
#define LR_TabbarSafeBottomMargin           (isIPhoneX_X_orMore ? 34.f : (isPad ? 15.f : 0.f))
#define ViewHeight [[UIScreen mainScreen] bounds].size.height - LR_TabbarSafeBottomMargin
#define kHJBottomHeight  [UIDevice safeBottom]
#define AsciiString(object) [LKFPrivateFunction lgjeropj_stringFromAsciiArray:object]
#define LocalString(string,comment) [LKFPrivateFunction lgjeropj_stringWithKid:string]
#define LocalInt(index) [LKFPrivateFunction lgjeropj_stringWithKid:@index]
#define kMainColor  [UIColor colorWithHexString:@"#232331"]
#define kNavBGColor  [UIColor colorWithHexString:@"#313143"]
#define kTabbarBGColor  [UIColor colorWithHexString:@"#1D1D1D"]

#endif /* HTCommonMacro_h */
