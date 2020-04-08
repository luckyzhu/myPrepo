//
//  WKViewController.m
//  summary
//
//  Created by NewBoy on 2020/3/31.
//  Copyright © 2020 LX. All rights reserved.
//

#import "WKViewController.h"
#import <WebKit/WebKit.h>
#import "WKDelegateController.h"

@interface WKViewController ()<WKDelegate,WKUIDelegate,WKNavigationDelegate>
{
    WKWebView *wkWebView;
    WKUserContentController *userContentController;
}
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 1.配置环境
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    userContentController =[[WKUserContentController alloc]init];
    configuration.userContentController = userContentController;
    wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:configuration];

    // 2.注册方法（必要设置，不然WKWebView会无法释放）
    WKDelegateController * delegateController = [[WKDelegateController alloc]init];
    delegateController.delegate = self;
    // 有添加一定有移除，成对出现
    [userContentController addScriptMessageHandler:delegateController  name:@"NativeMethod"];

    [self.view addSubview:wkWebView];

    wkWebView.UIDelegate = self;
    wkWebView.navigationDelegate = self;

    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 根据URL创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:15];
    [wkWebView loadRequest:request];

//#### 1.基本配置
//    NSMutableString *cookies = [NSMutableString string];
//    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource:[cookies copy]
//                                                         injectionTime:WKUserScriptInjectionTimeAtDocumentStart
//                                                      forMainFrameOnly:NO];
//    [userContentController addUserScript:cookieScript];
//
//    // 一下两个属性是允许H5视屏自动播放,并且全屏,可忽略
//    configuration.allowsInlineMediaPlayback = YES;
//    configuration.mediaPlaybackRequiresUserAction = NO;
//    // 全局使用同一个processPool
//    configuration.processPool = [[WKWebKitSupport sharedSupport] processPool];
//    configuration.userContentController = userContentController;

}

// 在收到响应后，决定是否跳转<br>
-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    NSLog(@"111----%@",navigationResponse.response.URL.absoluteString);
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)navigationResponse.response;
    // 获取cookie,并设置到本地
    NSArray *cookies =[NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:response.URL];
    for (NSHTTPCookie *cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }

    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
//    decisionHandler(WKNavigationResponsePolicyCancel);
}

//在发送请求之前，决定是否跳转
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
