//
//  shortCutViewController.m
//  summary
//
//  Created by NewBoy on 2019/5/27.
//  Copyright © 2019 LX. All rights reserved.
//

#import "shortCutViewController.h"

@interface shortCutViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView  *webView;

@end

@implementation shortCutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIWebView *webView = [[UIWebView alloc] init];
    webView.scrollView.backgroundColor = [UIColor lightGrayColor];
    webView.backgroundColor = [UIColor whiteColor];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    webView.frame = self.view.bounds;
    webView.scrollView.scrollEnabled = NO;
    [self.view addSubview:webView];
    self.webView = webView;


    NSString *urlStr = @"http://sisiw.ph/oauth/authorize?client_id=xess1VXEgrcKm0nh6V6p4LfjstRSiatTSuKRVW8W&redirect_uri=https%3A%2F%2Fapi.bbaecache.com%2Fapi%2Foauth_redirect&response_type=code";
//     NSString *urlStr = @"http://sisiw.ph/login";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
    [self.webView loadRequest:request];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length != 0) {
        // 如果length不为0，说明已经跳到回调地址，说明授权成功了
        NSUInteger index = range.location + range.length;
        NSString *code = [urlStr substringFromIndex:index];
        NSLog(@"授权成功了.code值是..%@",code);
        return NO;
    }
    NSLog(@"shouldStartLoadWithRequest----%@",urlStr);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{

    NSLog(@"webViewDidStartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{

    NSLog(@"webViewDidFinishLoad----%@",webView.request.URL.absoluteString);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError");

}

@end
