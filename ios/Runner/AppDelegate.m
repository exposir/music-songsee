#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <ShareSDK/ShareSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        //QQ
        [platformsRegister setupQQWithAppId:@"100371282" appkey:@"aed9b0303e3ed1e27bae87c33761161d"];
        
        
        //微信
        [platformsRegister setupWeChatWithAppId:@"wx617c77c82218ea2c" appSecret:@"c7253e5289986cf4c4c74d1ccc185fb1"];
        
        //新浪
        [platformsRegister setupSinaWeiboWithAppkey:@"568898243" appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3" redirectUrl:@"http://www.sharesdk.cn"];
        
        //Facebook
        [platformsRegister setupFacebookWithAppkey:@"1412473428822331" appSecret:@"a42f4f3f867dc947b9ed6020c2e93558" displayName:@"shareSDK"];
        
        //Twitter
        [platformsRegister setupTwitterWithKey:@"viOnkeLpHBKs6KXV7MPpeGyzE" secret:@"NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey" redirectUrl:@"http://mob.com"];
        //Instagram
        [platformsRegister setupInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058" clientSecret:@"1b2e82f110264869b3505c3fe34e31a1" redirectUrl:@"http://sharesdk.cn"];
        
        //钉钉
        [platformsRegister setupDingTalkWithAppId:@"dingoabcwtuab76wy0kyzo"];
        
        //支付宝
        [platformsRegister setupAliSocialWithAppId:@"2017062107540437"];
        
        //豆瓣
        [platformsRegister setupDouBanWithApikey:@"02e2cbe5ca06de5908a863b15e149b0b" appSecret:@"9f1e7b4f71304f2f" redirectUrl:@"http://www.sharesdk.cn"];
        
        //Dropbox
        [platformsRegister setupDropboxWithAppKey:@"us514wslpfojbxc" appSecret:@"w0nmp4os3ngo1ja" redirectUrl:@"http://localhost"];
        
        //易信
        [platformsRegister setupYiXinByAppId:@"yx0d9a9f9088ea44d78680f3274da1765f" appSecret:@"1a5bd421ae089c3" redirectUrl:@"https://open.yixin.im/resource/oauth2_callback.html"];
        //Flickr
        [platformsRegister setupFlickrWithApiKey:@"cbed81d4a1bc7417693ab7865e354717" apiSecret:@"4c490343869091f2"];
        
        //Instapaper
        [platformsRegister setupInstapaperWithConsumerKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA" consumerSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
        
        //Line
        [platformsRegister setupLineAuthType:SSDKAuthorizeTypeBoth];
        
        //YinXiang
        [platformsRegister setupEvernoteByConsumerKey:@"46131514-6903" consumerSecret:@"08d7a6f3afcc888a" sandbox:YES];
        
        //Evernote
        [platformsRegister setupEvernoteByConsumerKey:@"46131514-6903" consumerSecret:@"08d7a6f3afcc888a" sandbox:YES];
        
        //kakao
        [platformsRegister setupKaKaoWithAppkey:@"9c17eb03317e0e627ec95a400f5785fb" restApiKey:@"802e551a5048c3172fc1dedaaf40fcf1" redirectUrl:@"http://www.mob.com/oauth"];
        
        //VKontakte
        [platformsRegister setupVKontakteWithApplicationId:@"5312801" secretKey:@"ZHG2wGymmNUCRLG2r6CY" authType:SSDKAuthorizeTypeBoth];
        
        //YouTube
        [platformsRegister setupYouTubeWithClientId:@"906418427202-jinnbqal1niq4s8isbg2ofsqc5ddkcgr.apps.googleusercontent.com" clientSecret:@"" redirectUrl:@"http://localhost"];
        
        //美拍
        [platformsRegister setupMeiPaiWithAppkey:@"1089867639"];
        
        //腾讯微博
        [platformsRegister setupTencentWeiboWithAppkey:@"801307650" appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c" redirectUrl:@"http://www.sharesdk.cn"];
        
        //人人网
        [platformsRegister setupRenRenWithAppId:@"226427" appKey:@"fc5b8aed373c4c27a05b712acba0f8c3" secretKey:@"f29df781abdd4f49beca5a2194676ca4" authType:SSDKAuthorizeTypeBoth];
        
        //CMCC
        [platformsRegister setupCMCCByAppId:@"300011862498" appKey:@"38D9CA1CC280C5F207E2C343745D4A4B" displayUI:YES];
        
        //有道云笔记
        [platformsRegister setupYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940" consumerSecret:@"d98217b4020e7f1874263795f44838fe" oauthCallback:@"http://www.sharesdk.cn/"];
        
        //明道
        [platformsRegister setupMingDaoByAppKey:@"97230F25CA5C" appSecret:@"A5DC29AF7C5A5851F28E903AE9EAC0" redirectUrl:@"http://mob.com"];
        
        //开心网
        [platformsRegister setupKaiXinByApiKey:@"358443394194887cee81ff5890870c7c" secretKey:@"da32179d859c016169f66d90b6db2a23" redirectUrl:@"http://www.sharesdk.cn/"];
        
        //Google+
        [platformsRegister setupGooglePlusByClientID:@"351114257251-isfr7cnt5gop930krntpf246d9ofv8j5.apps.googleusercontent.com" clientSecret:@"" redirectUrl:@"http://localhost"];
        
        //Pinterest
        [platformsRegister setupPinterestByClientId:@"4987008320438021391"];
        
        //Pocket
        [platformsRegister setupPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627" redirectUrl:@"pocketapp1234"];
        
        //LinkedIn
        [platformsRegister setupLinkedInByApiKey:@"46kic3zr7s4n" secretKey:@"RWw6WRl9YJOcdWsj" redirectUrl:@"http://baidu.com"];
        
        //Instapaper
        [platformsRegister setupInstapaperWithConsumerKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA" consumerSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
        
        //Tumblr
        [platformsRegister setupTumblrByConsumerKey:@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM" consumerSecret:@"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo" redirectUrl:@"http://sharesdk.cn"];
        
        //SMS
        [platformsRegister setupSMSOpenCountryList:NO];
        
        //Telegram
        [platformsRegister setupTelegramByBotToken:@"600852601:AAElp9J93JiYevLocDIEYPhEYulnMFuB_nQ" botDomain:@"http://127.0.0.1"];
        
        //Reddit
        [platformsRegister setupRedditByAppKey:@"ObzXn50T7Cg0Xw" redirectUri:@"https://www.mob.com/reddit_callback"];
        
    }];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
