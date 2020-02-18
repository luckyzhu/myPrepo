//
//  VLSubmmitButton.m
//  summary
//
//  Created by NewBoy on 2019/10/31.
//  Copyright © 2019 LX. All rights reserved.
//

#import "VLSubmmitButton.h"
#import "Masonry.h"

@interface VLSubmmitButton()

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *messageLabel;
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;

@end
@implementation VLSubmmitButton

-(UIView *)backView
{
    if (_backView == nil) {
        _backView = [[UIView alloc]init];
        _backView.alpha = 0;
        [self addSubview:_backView];
    }

    return _backView;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        [self.backView addSubview:_messageLabel];
    }
    return _messageLabel;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _indicatorView.hidesWhenStopped = YES;
        [self.backView addSubview:_indicatorView];
        [_indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.messageLabel.mas_right).offset(2);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _indicatorView;
}

- (void)loadingWithMessage:(NSString *)message{

    [self layoutIfNeeded];
    self.enabled = NO;
    self.messageLabel.text = message;
    self.messageLabel.textColor = self.titleLabel.textColor;
    self.messageLabel.font = self.titleLabel.font;
    [self.messageLabel sizeToFit];
    [self.indicatorView startAnimating];

    self.backView.frame = self.bounds;
    CGFloat messageLabelX = (self.frame.size.width - self.messageLabel.frame.size.width) / 2;
    CGFloat messageLabelY = (self.frame.size.height - self.messageLabel.frame.size.height) / 2;
    self.messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, self.messageLabel.frame.size.width, self.messageLabel.frame.size.height);

    [UIView animateWithDuration:0.2 animations:^{
        self.imageView.alpha = 0;
        self.titleLabel.alpha = 0;
        self.backView.alpha = 1;
    }];
}

- (void)backToNormal {

    self.enabled = YES;

    [UIView animateWithDuration:0.2 animations:^{
        self.imageView.alpha = 1;
        self.titleLabel.alpha = 1;
        self.backView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.indicatorView stopAnimating];
    }];

}
@end
