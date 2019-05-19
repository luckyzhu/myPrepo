
//
//  LXTestView.m
//  summary
//
//  Created by NewBoy on 2019/5/15.
//  Copyright © 2019 LX. All rights reserved.
//

#import "LXTestView.h"
#import "markdown_lib.h"
#import "markdown_peg.h"
#import "Masonry.h"

@interface LXTestView()<UITextViewDelegate>

@property (nonatomic,assign) BBAEDealTipAlterViewType dealType;
@property (nonatomic,copy)   NSString *showStr;
@property (nonatomic,assign) BOOL useMd;
@property (nonatomic,strong) UIButton *leftButton;

@end

#define iPhone5_8   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size): NO)


@implementation LXTestView

-(instancetype)initWithDealTipViewType:(BBAEDealTipAlterViewType)dealType showStr:(NSString *)showStr useMd:(BOOL)useMd
{

    if (self = [super init]) {

        self.dealType = dealType;
        self.useMd = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];

        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height - ((iPhone5_8 ? 34 : 0)));

        UITextView *messageLabel = [[UITextView alloc]init];
        messageLabel.editable = NO;
        messageLabel.delegate = self;
        if (self.useMd) {//用md渲染
            messageLabel.attributedText = [self getMdStr:showStr];
        }else{
            messageLabel.text = showStr;
        }
        [self addSubview:messageLabel];

        CGFloat buttonHeight = 44;
        UIButton *leftButton = [[UIButton alloc]init];
        leftButton.backgroundColor = [UIColor blueColor];
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        leftButton.backgroundColor = [UIColor blueColor];
        [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftButton];
        __weak typeof(self)weakSelf = self;
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(weakSelf);
            make.height.mas_equalTo(buttonHeight);
            make.right.mas_equalTo(weakSelf.mas_centerX).offset(1);
        }];
        self.leftButton = leftButton;

        UIButton *rightButton = [[UIButton alloc]init];
        leftButton.backgroundColor = [UIColor blueColor];
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        rightButton.titleLabel.textColor = [UIColor whiteColor];
        [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(weakSelf);
            make.height.mas_equalTo(buttonHeight);
            make.left.mas_equalTo(weakSelf.mas_centerX).offset(1);
        }];

        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.mas_top).offset(64); //距上边间距100
            make.left.mas_equalTo(weakSelf.mas_left).offset(16);
            make.right.mas_equalTo(weakSelf.mas_right).offset(-16);
            make.bottom.mas_equalTo(leftButton.mas_top);
        }];

        [messageLabel layoutIfNeeded];

        NSLog(@"333---%@",NSStringFromCGRect(messageLabel.frame));

        if ((80 + messageLabel.frame.size.height + 44 + (iPhone5_8 ? 34 : 0)) > [UIScreen mainScreen].bounds.size.height) {
            messageLabel.scrollEnabled = YES;
        }else{
            messageLabel.scrollEnabled = NO;
        }

    }

    return self;
}

-(void)show{

    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)leftBtnClick{

    if (self.delegate && [self.delegate respondsToSelector:@selector(leftButtonClick:)]) {
        [self.delegate leftButtonClick:self.dealType];
    }

}
-(void)rightBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightButtonClick:)]) {
        [self.delegate rightButtonClick:self.dealType];
    }
}
-(NSMutableAttributedString *)getMdStr:(NSString *)mdStr{

    NSMutableAttributedString* attr_out = nil;

    NSMutableDictionary* attributes = [[NSMutableDictionary alloc]init];

    // p

    UIFont *paragraphFont = [UIFont systemFontOfSize:15];
    NSMutableParagraphStyle* pParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    pParagraphStyle.paragraphSpacing = 5;
    pParagraphStyle.paragraphSpacingBefore = 5;
    //    pParagraphStyle.lineSpacing = 8;
    NSDictionary *pAttributes = @{
                                  NSFontAttributeName : paragraphFont,
                                  NSParagraphStyleAttributeName : pParagraphStyle,
                                  NSForegroundColorAttributeName : [UIColor cyanColor],
                                  };

    [attributes setObject:pAttributes forKey:@(PARA)];

    // h1
    UIFont *h1Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h1Font} forKey:@(H1)];

    // h2
    UIFont *h2Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h2Font} forKey:@(H2)];

    // h3
    UIFont *h3Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h3Font} forKey:@(H3)];

    // h4
    UIFont *h4Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h4Font} forKey:@(H4)];

    // h5
    UIFont *h5Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h5Font} forKey:@(H5)];

    // h6
    UIFont *h6Font = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : h6Font} forKey:@(H6)];

    // em
    UIFont *emFont = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : emFont} forKey:@(EMPH)];

    // strong
    UIFont *strongFont = [UIFont systemFontOfSize:15];
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
    UIFont *verbatimFont = [UIFont systemFontOfSize:15];
    [attributes setObject:@{NSFontAttributeName : verbatimFont, NSParagraphStyleAttributeName : verbatimParagraphStyle} forKey:@(VERBATIM)];

    attr_out = markdown_to_attr_string(mdStr,0,attributes);

    return attr_out;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{

    if (self.delegate && [self.delegate respondsToSelector:@selector(alertView2DidClickLink:inRange:)]) {
        [self.delegate alertView2DidClickLink:URL inRange:characterRange];
    }
    return NO;
}


@end
