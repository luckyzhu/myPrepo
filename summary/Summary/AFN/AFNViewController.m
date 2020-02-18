//
//  AFNViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "AFNViewController.h"
#import <AFNetworking.h>
#import "markdown_lib.h"
#import "markdown_peg.h"
#import "Masonry.h"
#import "summary-Swift.h"


@interface AFNViewController ()<UITextViewDelegate,WKUIDelegate,WKNavigationDelegate,NSSecureCoding>
{
    WKWebView *_webView;

}
@property (nonatomic,strong) NSOperationQueue  *queue;
@property (nonatomic,strong) dispatch_queue_t serialQueue;
@property (nonatomic,strong) AFHTTPSessionManager *session;
@property (nonatomic,strong) NSMutableArray *taskArray;

@property (nonatomic,assign) BOOL isRequest;

@property (strong, nonatomic) NSAttributedString *string;
@property (strong, nonatomic) UITextView *textView;



@end

@implementation AFNViewController


- (void)btnClick{

    //1. 用原生的NSURLSession请求
//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//    NSDictionary *dict = @{
//                          @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                          @"usAccountID":@296,
//                          @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                          @"userID":@"135956817",
//                          @"username":@"m1359568172",
//                          };
//
//
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    // 执行异步任务1
//    NSURLSessionDataTask *task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        NSLog(@"11111----%@",response);
//    }];
//    [task resume];


         //2.用AFN发送网络请求
        NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.requestSerializer.timeoutInterval = 30;
    session.requestSerializer.allowsCellularAccess = NO;

    NSDictionary *dict = @{
        @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
        @"usAccountID":@296,
        @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
        @"userID":@"135956817",
        @"username":@"m1359568172",
    };
    // 执行异步任务1
    [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSLog(@"11111---%@",(NSHTTPURLResponse *)task.response);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error111--%@",error);
    }];

    return;
    //3.AFN测试上传
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 100;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html",@"application/json", @"text/json" ,@"text/javascript", nil];
    [manager POST:@"https://www.baidu.com" parameters:@{@"mydic":@{
                                                                @"key1":@"value1",
                                                                @"key2":@"value2"
                                                                  },
                                                        @"myArray":@[@"v1", @"v2", @"v3"]
    } constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:[@"Data" dataUsingEncoding:NSUTF8StringEncoding]
//                                    name:@"DataName"
//                                fileName:@"DataFileName"
//                                mimeType:@"data"]; //支持NSData上传
// 支持file文件
        NSString *theImagePath = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"png"];
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"shuohaobuku.mp3" ofType:nil];
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:theImagePath] name:@"filename" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress----%@",[NSProgress currentProgress]);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success---%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"success");
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}



#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{

}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    NSLog(@"1111-----%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
#pragma mark - WKUIDelegate
// 创建一个新的WebView
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return [[WKWebView alloc]init];
}
// 输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    completionHandler(@"http");
}
// 确认框
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    completionHandler(YES);
}
// 警告框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"%@",message);
    completionHandler();
}

-(void)test1{
    //markdown 格式转属性字符串
    /*
     AttributedMarkdown 框架
     https://github.com/iwasrobbed/Down
     */

    NSMutableDictionary* attributes = [[NSMutableDictionary alloc]init];

    // p
//
//    UIFont *paragraphFont = [UIFont fontWithName:@"AvenirNext-Medium" size:15.0];
//    NSMutableParagraphStyle* pParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//
//    pParagraphStyle.paragraphSpacing = 12;
//    pParagraphStyle.paragraphSpacingBefore = 12;
//    NSDictionary *pAttributes = @{
//                                  NSFontAttributeName : paragraphFont,
//                                  NSParagraphStyleAttributeName : pParagraphStyle,
//                                  NSForegroundColorAttributeName :[UIColor redColor],
//                                  };
//
//    [attributes setObject:pAttributes forKey:@(PARA)];
//
//    // h1
//    UIFont *h1Font = [UIFont fontWithName:@"AvenirNext-Bold" size:24.0];
//    [attributes setObject:@{NSFontAttributeName : h1Font,NSForegroundColorAttributeName :[UIColor greenColor]} forKey:@(H1)];
//
//    // h2
//    UIFont *h2Font = [UIFont fontWithName:@"AvenirNext-Bold" size:18.0];
//    [attributes setObject:@{NSFontAttributeName : h2Font,NSForegroundColorAttributeName :[UIColor greenColor]} forKey:@(H2)];
//
//    // h3
//    UIFont *h3Font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:17.0];
//    [attributes setObject:@{NSFontAttributeName : h3Font,NSForegroundColorAttributeName :[UIColor greenColor]} forKey:@(H3)];
//
//    // em  斜体
//    UIFont *emFont = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:15.0];
////    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(30 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
////    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix :matrix];//取得系统字符并设置反射。14
////    UIFont *emFont = [UIFont fontWithDescriptor:desc size:14];
//    [attributes setObject:@{NSFontAttributeName : emFont,NSForegroundColorAttributeName :[UIColor cyanColor]} forKey:@(EMPH)];
//     // strong
//    UIFont *strongFont = [UIFont systemFontOfSize:35];
//    [attributes setObject:@{NSFontAttributeName : strongFont,NSForegroundColorAttributeName :[UIColor yellowColor]} forKey:@(STRONG)];
//
//    // ul
//    NSMutableParagraphStyle* listParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    listParagraphStyle.headIndent = 16.0;
//    [attributes setObject:@{NSFontAttributeName : paragraphFont, NSParagraphStyleAttributeName : listParagraphStyle} forKey:@(BULLETLIST)];
//
//    // li
//    NSMutableParagraphStyle* listItemParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    listItemParagraphStyle.headIndent = 16.0;
//    [attributes setObject:@{NSFontAttributeName : paragraphFont, NSParagraphStyleAttributeName : listItemParagraphStyle} forKey:@(LISTITEM)];
//
//    // blockquote
//    NSMutableParagraphStyle* blockquoteParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    blockquoteParagraphStyle.headIndent = 16.0;
//    blockquoteParagraphStyle.tailIndent = 16.0;
//    blockquoteParagraphStyle.firstLineHeadIndent = 16.0;
//    [attributes setObject:@{NSFontAttributeName : [emFont fontWithSize:18.0], NSParagraphStyleAttributeName : pParagraphStyle} forKey:@(BLOCKQUOTE)];
//
//    // verbatim (code)
//    NSMutableParagraphStyle* verbatimParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    verbatimParagraphStyle.headIndent = 12.0;
//    verbatimParagraphStyle.firstLineHeadIndent = 12.0;
//    UIFont *verbatimFont = [UIFont fontWithName:@"CourierNewPSMT" size:14.0];
//    [attributes setObject:@{NSFontAttributeName : verbatimFont, NSParagraphStyleAttributeName : verbatimParagraphStyle} forKey:@(VERBATIM)];


    //    NSError* error;
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"README" ofType:@"markdown"];
    //    NSString* inputText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    //    NSString* inputText =  @"- [Rob Phillips](https://github.com/iwasrobbed)"; <br/>
    //    图片格式 https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=702257389,1274025419&fm=27&gp=0.jpg
    //
    //    标题
    //    NSString* inputText =  @"*This is freedom * freedome";
    //
    //    加粗
    //    NSString* inputText =  @"**This is freedom** freedome";
    //
    //    斜体
    //    NSString* inputText =  @"*This is freedom* freedome";
    //
    //    删除线
    //    NSString* inputText =  @"1. 123 2. 3323 3. 44123";

    //    NSString* inputText =  @"#一级标题  **this** *inputText* attributesattributes >引用- [Rob Phillips](https://github.com/iwasrobbed) - [Rob Phillips](https://github.com/iwasrobbed)- [Rob Phillips](https://github.com/iwasrobbed)- [Rob Phillips](https://github.com/iwasrobbed)";
    //
    //    NSString *inputText = @"**this**  jjj</br></br></br></br>  *inputText* <br />[链接](https://github.com/iwasrobbed) **this**  jjj</br></br></br></br>  *inputText* <br />[链接](https://github.com/iwasrobbed) **this**  jjj</br></br></br></br>  *inputText* <br />[链接](https://github.com/iwasrobbed)";

    //    连续两个以上空格+回车
    //    //![mahua](mahua-logo.jpg)
    NSString *inputText = @"**this**    \n**哈哈哈**\n\n*inputText*\n\n*汉字需要斜体*\n\n>引用\n\n[链接](https://github.com/iwasrobbed)";

    //      NSString *inputText = @"hhahahhahh哈哈哈哈哈哈哈";



    //链接
    //    NSString* inputText =  @"- [Rob Phillips](https://github.com/iwasrobbed)";

    //引用
    //    NSString* inputText =  @" this is yingyong";

    NSMutableAttributedString* attr_out = markdown_to_attr_string(inputText,0,attributes);
    self.string = attr_out;

    /*
     支持的md格式:
     H1, H2, H3, H4, H5, H6, 加粗,斜体，链接，引用
     */
    UITextView *textView = [[UITextView alloc]init];
    textView.attributedText = attr_out;
    textView.delegate = self;
    //    textView.frame = CGRectMake(0,100, self.view.frame.size.width, 50);
    textView.scrollEnabled = NO;
    textView.editable = NO;
    textView.backgroundColor = [UIColor lightGrayColor];
    //    textView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textView];
    self.textView = textView;

    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(64);
        make.height.mas_greaterThanOrEqualTo(20);
    }];

    [self.textView layoutIfNeeded];
    if (self.textView.frame.size.height > self.view.frame.size.height - 64 - 78) {
        textView.scrollEnabled = YES;
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.right.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_top).offset(64);
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-78);
        }];
    }

    //
    //    self.queue = [[NSOperationQueue alloc]init];
    //    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    //    self.serialQueue = queue;
    //
    //    self.taskArray = [NSMutableArray array];
    //
    //   self.session = [AFHTTPSessionManager manager];

}

-(void)handleTap:(UITapGestureRecognizer*)tap
{

    NSLog(@"9999");
    UITextRange *characterRange = [self.textView characterRangeAtPoint:[tap locationInView:self.textView]];
    NSInteger startOffset = [self.textView offsetFromPosition:self.textView.beginningOfDocument toPosition:characterRange.start];
    NSInteger endOffset = [self.textView offsetFromPosition:self.textView.beginningOfDocument toPosition:characterRange.end];
    NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
    [self.string enumerateAttributesInRange:offsetRange options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        NSURL *link = [attrs objectForKey:@"attributedMarkdownURL"];
        if (link) {
            NSLog(@"%@",link);
            [[UIApplication sharedApplication] openURL:link];
        }
    }];
}

//- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){
//
//
//    NSLog(@"shouldInteractWithURL---%@",URL);
//    return YES;
//
//}
-(void)testCode{

    //        NSDictionary *dict = @{
    //                               @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                               @"usAccountID":@296,
    //                               @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                               @"userID":@"135956817",
    //                               @"username":@"m1359568172",
    //                               };
    //    // 执行异步任务1
    //    NSURLSessionDataTask *task = [self.session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSLog(@"11111----%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        NSLog(@"22222----%@",error);
    //    }];

    //    [self.taskArray addObject:task];
    //    if (self.isRequest) return;
    //    self.isRequest = YES;
    //    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //
    //    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //    NSDictionary *dict = @{
    //                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                           @"usAccountID":@296,
    //                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                           @"userID":@"135956817",
    //                           @"username":@"m1359568172",
    //                           };
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        // 执行异步任务1
    //        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            self.isRequest = NO;
    //            NSLog(@"11111");
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"22222");
    //        }];
    //    });


    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"bbb");
    //        // 执行异步任务2
    //        dispatch_group_enter(group);
    //        NSString *urlStr2 = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //        [session POST:urlStr2 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"22222");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"shibaile");
    //        }];
    //
    //    });


    //    dispatch_group_t group =dispatch_group_create();
    ////     dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    //
    //    dispatch_queue_t queue = dispatch_queue_create("ted.queue.next1", DISPATCH_QUEUE_CONCURRENT);
    //
    //    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //
    //    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //
    //    NSDictionary *dict = @{
    //                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                           @"usAccountID":@296,
    //                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                           @"userID":@"135956817",
    //                           @"username":@"m1359568172",
    //                           };
    //
    //    dispatch_group_enter(group);
    //    dispatch_group_async(group, queue, ^{
    //
    //        NSLog(@"aaaa");
    //        // 执行异步任务1
    //        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"11111");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"error111--%@",error);
    //        }];
    //    });
    //
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"bbb");
    //        // 执行异步任务2
    //        dispatch_group_enter(group);
    //        NSString *urlStr2 = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //        [session POST:urlStr2 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"22222");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"shibaile");
    //        }];
    //
    //    });
    //
    //    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
    //        NSLog(@"33---%@", [NSThread currentThread]);
    //        NSLog(@"完成...");
    //    });
}

//7.用户访问网站的原理过程
-(void)summary1{

    /*
     01. DNS域名解析，获悉域名对应IP地址
     02. 根据IP地址访问网站服务器，TCP三次握手过程
     03. 用户向网站服务请求信息，HTTP请求过程（HTTP请求报文）
     04. 网站服务对用户请求进行响应，HTTP响应过程（HTTP响应报文）
      说明：03 04步骤就称为HTTP协议原理过程
     05. 断开网络连接，TCP四次挥手过程

     */
}

@end
