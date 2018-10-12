//
//  BBAESlideShowView.m
//  summary
//
//  Created by NewBoy on 2018/9/26.
//  Copyright © 2018年 LX. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "BBAESlideShowView.h"
#import "Masonry.h"


@interface BBAESlideShowView()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *currentImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,assign) NSInteger currentPage; //第几张图片。与数组数量下标不一样。
@property (nonatomic,strong) NSArray *imageUrls;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) CGFloat scrollWidth;
@property (nonatomic,assign) BOOL isDataSourcesCountLessThree;

@end

@implementation BBAESlideShowView

-(instancetype)initWithCGSize:(CGSize)size dataArray:(NSArray *)dataArray{
    if (self = [super init]) {

        self.imageUrls = dataArray;
        if (self.imageUrls.count == 0)  return nil;

        UIScrollView *scrollView = [UIScrollView new];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.alwaysBounceHorizontal = YES;
//        scrollView.frame = CGRectMake(0, 0, size.width, size.height);
        scrollView.backgroundColor = [UIColor blueColor];
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];

        UIView *contentView = [UIView new];
        [scrollView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.height.equalTo(scrollView);
        }];


        UIImageView *leftImageView = [[UIImageView alloc]init];
//        leftImageView.frame = CGRectMake(0, 0,size.width, size.height);
        [contentView addSubview:leftImageView];
        self.leftImageView = leftImageView;
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(contentView);
            make.width.mas_equalTo(@(scrollView.frame.size.width));
        }];

        UIImageView *currentImageView = [[UIImageView alloc]init];
//        currentImageView.frame = CGRectMake(size.width, 0,size.width, size.height);
        [contentView addSubview:currentImageView];
        self.currentImageView = currentImageView;
        [currentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftImageView.mas_right).offset(0);
            make.top.bottom.mas_equalTo(contentView);
            make.width.mas_equalTo(@(scrollView.frame.size.width));
        }];

        UIImageView *rightImageView = [[UIImageView alloc]init];
//        rightImageView.frame = CGRectMake(size.width * 2,0,size.width, size.height);
        [contentView addSubview:rightImageView];
        self.rightImageView = rightImageView;
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(currentImageView.mas_right).offset(0);
            make.top.bottom.mas_equalTo(contentView);
            make.width.mas_equalTo(@(scrollView.frame.size.width));
        }];

        self.currentPage = 0;
        self.scrollView.contentSize = CGSizeMake(size.width * 3, size.height);

        if (dataArray.count == 1 ) {
            rightImageView.hidden = YES;
            leftImageView.hidden = YES;
            self.scrollView.contentSize = CGSizeMake(size.width * 1, size.height);
        }else if (dataArray.count == 2) {
            leftImageView.hidden = YES;
            self.scrollView.contentSize = CGSizeMake(size.width * 2, size.height);
        }

        [self setImageByIndex:(int) self.currentPage array:self.imageUrls];
        self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.currentImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView setContentOffset:CGPointMake(size.width, 0) animated:NO];
    }
    return self;
}

- (void)autoScroll{

    [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];

}

-(void)setHasPageControl:(BOOL)hasPageControl
{
    _hasPageControl = hasPageControl;

    if (self.hasPageControl) {
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 20, self.scrollView.frame.size.width, 20)];
        self.pageControl.numberOfPages = self.imageUrls.count;
        self.pageControl.currentPageIndicatorTintColor=[UIColor lightGrayColor];
        self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        self.pageControl.userInteractionEnabled = NO;
        [self addSubview:self.pageControl];

        self.pageControl.currentPage = self.currentPage;
    }
}

-(void)setScrollType:(BBAESlideShowViewScrollType)scrollType
{
    _scrollType = scrollType;

    if (self.scrollType == BBAESlideShowViewScrollType_Timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    }
}

// 拖拽时停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.scrollType == BBAESlideShowViewScrollType_Timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

//拖拽结束时开始定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.scrollType == BBAESlideShowViewScrollType_Timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x  > scrollView.frame.size.width) { //显示右边区域

        self.currentPage = ((self.currentPage + 1) % self.imageUrls.count);

    }else if (scrollView.contentOffset.x < scrollView.frame.size.width){//显示左边区域

        //防止currentIndex为0时，数组越界
        self.currentPage = ((self.currentPage - 1 + self.imageUrls.count) % self.imageUrls.count);
    }

    scrollView.contentOffset = CGPointMake(scrollView.frame.size.width * 1, 0);

    [self setImageByIndex:(int)self.currentPage array:self.imageUrls];
    if (self.hasPageControl) {
        self.pageControl.currentPage = self.currentPage;
    }

}

-(void)setImageByIndex:(int)currentIndex array:(NSArray *)array
{
    [self.currentImageView sd_setImageWithURL:[NSURL URLWithString:array[currentIndex]] placeholderImage:[UIImage imageNamed:array[currentIndex]]];
    self.currentImageView.userInteractionEnabled = YES;
    [self.currentImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgViewClick)]];

    NSString *leftURLString = array[((self.currentPage - 1 + self.imageUrls.count) % self.imageUrls.count)];
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:leftURLString] placeholderImage:[UIImage imageNamed:leftURLString]];


    NSString *rightURLString = array[((self.currentPage + 1) % self.imageUrls.count)];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:rightURLString] placeholderImage:[UIImage imageNamed:rightURLString]];;
}

-(void)imgViewClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(slideShowViewDidClick:)]) {
        [self.delegate slideShowViewDidClick:self.currentPage];
    }
}

@end
