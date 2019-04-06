//
//  AFNViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "AFNViewController.h"
#import <AFNetworking.h>
#import "markdown_lib.h"
#import "markdown_peg.h"
#import "Masonry.h"

@interface AFNViewController ()<UITextViewDelegate>
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

//    //1. 用原生的NSURLSession请求
//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//    NSDictionary *dict = @{
//                          @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                          @"usAccountID":@296,
//                          @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                          @"userID":@"135956817",
//                          @"username":@"m1359568172",
//                          };
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
    NSLog(@"session-----%@",session);

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


}
- (void)viewDidLoad {
    [super viewDidLoad];

//    UIView *superView = [UIView new];
//
//    UIImageView *settingImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"auto"]];
//    [settingImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(settingImageClick)]];
//    [self.view addSubview:settingImage];
//    [settingImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.totalAssetsLabel.centerY);
//        make.right.mas_equalTo(tipImage.left).offset(-10);
//        make.size.mas_equalTo(CGSizeMake(settingImage.frame.size.width, settingImage.frame.size.height));
//    }];

    //markdown 格式转属性字符串
    /*
     AttributedMarkdown 框架
     https://github.com/iwasrobbed/Down
     */

    NSMutableDictionary* attributes = [[NSMutableDictionary alloc]init];

    // p

    UIFont *paragraphFont = [UIFont fontWithName:@"AvenirNext-Medium" size:15.0];
    NSMutableParagraphStyle* pParagraphStyle = [[NSMutableParagraphStyle alloc]init];

    pParagraphStyle.paragraphSpacing = 12;
    pParagraphStyle.paragraphSpacingBefore = 12;
    NSDictionary *pAttributes = @{
                                  NSFontAttributeName : paragraphFont,
                                  NSParagraphStyleAttributeName : pParagraphStyle,
                                  };

    [attributes setObject:pAttributes forKey:@(PARA)];

    // h1
    UIFont *h1Font = [UIFont fontWithName:@"AvenirNext-Bold" size:24.0];
    [attributes setObject:@{NSFontAttributeName : h1Font} forKey:@(H1)];

    // h2
    UIFont *h2Font = [UIFont fontWithName:@"AvenirNext-Bold" size:18.0];
    [attributes setObject:@{NSFontAttributeName : h2Font} forKey:@(H2)];

    // h3
    UIFont *h3Font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:17.0];
    [attributes setObject:@{NSFontAttributeName : h3Font} forKey:@(H3)];

    // em
    UIFont *emFont = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:15.0];
    [attributes setObject:@{NSFontAttributeName : emFont} forKey:@(EMPH)];

    // strong
    UIFont *strongFont = [UIFont fontWithName:@"AvenirNext-Bold" size:15.0];
    [attributes setObject:@{NSFontAttributeName : strongFont} forKey:@(STRONG)];

    // ul
    NSMutableParagraphStyle* listParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    listParagraphStyle.headIndent = 16.0;
    [attributes setObject:@{NSFontAttributeName : paragraphFont, NSParagraphStyleAttributeName : listParagraphStyle} forKey:@(BULLETLIST)];

    // li
    NSMutableParagraphStyle* listItemParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    listItemParagraphStyle.headIndent = 16.0;
    [attributes setObject:@{NSFontAttributeName : paragraphFont, NSParagraphStyleAttributeName : listItemParagraphStyle} forKey:@(LISTITEM)];

    // a
    UIColor *linkColor = [UIColor blueColor];
    [attributes setObject:@{NSForegroundColorAttributeName : linkColor} forKey:@(LINK)];

    // blockquote
    NSMutableParagraphStyle* blockquoteParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    blockquoteParagraphStyle.headIndent = 16.0;
    blockquoteParagraphStyle.tailIndent = 16.0;
    blockquoteParagraphStyle.firstLineHeadIndent = 16.0;
    [attributes setObject:@{NSFontAttributeName : [emFont fontWithSize:18.0], NSParagraphStyleAttributeName : pParagraphStyle} forKey:@(BLOCKQUOTE)];

    // verbatim (code)
    NSMutableParagraphStyle* verbatimParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    verbatimParagraphStyle.headIndent = 12.0;
    verbatimParagraphStyle.firstLineHeadIndent = 12.0;
    UIFont *verbatimFont = [UIFont fontWithName:@"CourierNewPSMT" size:14.0];
    [attributes setObject:@{NSFontAttributeName : verbatimFont, NSParagraphStyleAttributeName : verbatimParagraphStyle} forKey:@(VERBATIM)];


//    NSError* error;
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"README" ofType:@"markdown"];
//    NSString* inputText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
//    NSString* inputText =  @"- [Rob Phillips](https://github.com/iwasrobbed)"; <br/>
    NSString* inputText =  @"Hello, world. *This* is  - [百度](https://www.baidu.com)  <br/>1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML ![avatar](https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=dog%20picture&step_word=&hs=2&pn=1&spn=0&di=67470099620&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=2022767672%2C792259952&os=2275055259%2C1928930628&simid=3339461201%2C154105304&adpicid=0&lpn=0&ln=814&fr=&fmq=1553601713773_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fanimal-world.com%2Fdogs%2FHound-Dog-Breeds%2Fimages%2FBeagle2WDHo_Ap6D.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3F152f_z%26e3Bwgt4ws-o56s1_z%26e3Bv54AzdH3F152fAzdH3FH57g1-D52-B6jj1fAzdH3FH57g1D52B6jj1f_z%26e3Brir&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined)code 2. **User Interface** - UI-related classes render these objects, specifically `DTAttributedTextView`, `DTAttributedLabel` and `DTAttributedTextCell`.Hello, world. *This* is  - [百度](https://www.baidu.com)  1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML code 2. **User Interface** - UI-related classes render these objects, specifically `DTAttributedTextView`, `DTAttributedLabel` and `DTAttributedTextCell`.Hello, world. *This* is  - [百度](https://www.baidu.com)  1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML code 2. **User Interface** - UI-related classes render these objects, specifically `DTAttributedTextView`, `DTAttributedLabel` and `DTAttributedTextCell`.Hello, world. *This* is  - [百度](https://www.baidu.com)  1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML code 2. **User Interface** - UI-related classes render these objects, specifically `DTAttributedTextVie *This* is  - [百度](https://www.baidu.com)  1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML code *This* is  - [百度](https://www.baidu.com)  1. **Layouting** - Interfacing with CoreText, generating attributed strings from HTML code" ;
    NSMutableAttributedString* attr_out = markdown_to_attr_string(inputText,0,attributes);
    self.string = attr_out;


    UITextView *textView = [[UITextView alloc]init];
    textView.attributedText = self.string;
    textView.delegate = self;
//    textView.frame = CGRectMake(0,100, self.view.frame.size.width, 50);
    textView.scrollEnabled = NO;
    textView.editable = NO;
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.textAlignment = NSTextAlignmentCenter;
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
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
//    [self.textView addGestureRecognizer:tap];



//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(100, 400, 50, 50);
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor redColor];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    button.exclusiveTouch = YES;
//    [self.view addSubview:button];
//
//    self.queue = [[NSOperationQueue alloc]init];
//    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
//    self.serialQueue = queue;
//
//    self.taskArray = [NSMutableArray array];
//
//   self.session = [AFHTTPSessionManager manager];


}

//-(void)handleTap:(UITapGestureRecognizer*)tap
//{
//
//    NSLog(@"9999");
//    UITextRange *characterRange = [self.textView characterRangeAtPoint:[tap locationInView:self.textView]];
//    NSInteger startOffset = [self.textView offsetFromPosition:self.textView.beginningOfDocument toPosition:characterRange.start];
//    NSInteger endOffset = [self.textView offsetFromPosition:self.textView.beginningOfDocument toPosition:characterRange.end];
//    NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
//    [self.string enumerateAttributesInRange:offsetRange options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
//        NSURL *link = [attrs objectForKey:@"attributedMarkdownURL"];
//        if (link) {
//            NSLog(@"%@",link);
//            [[UIApplication sharedApplication] openURL:link];
//        }
//    }];
//}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){


    NSLog(@"shouldInteractWithURL---%@",URL);
    return YES;

}
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
