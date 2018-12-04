//
//  BBAESlideIntervalView.m
//  summary
//
//  Created by NewBoy on 2018/10/14.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "BBAESlideIntervalView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"


@interface BBAESlideIntervalView()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *currentImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,assign) NSInteger currentPage; //第几张图片。与数组数量下标不一样。
@property (nonatomic,strong) NSArray *imageUrls;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) CGFloat imageRectWidth;
@property (nonatomic,assign) CGFloat contentOffsetX;
@property (nonatomic,assign) BOOL isDataSourcesCountLessThree;
@property (nonatomic,assign) BOOL didScroll;

@end

@implementation BBAESlideIntervalView
-(instancetype)initWithCGSize:(CGSize)size dataArray:(NSArray *)dataArray{
    if (self = [super init]) {

        self.imageUrls = dataArray;
        if (self.imageUrls.count == 0)  return nil;

        self.imageRectWidth = size.width - 24;


        UIScrollView *scrollView = [UIScrollView new];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.alwaysBounceHorizontal = YES;
        scrollView.clipsToBounds = NO;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(self);
            make.left.bottom.top.mas_equalTo(self);
            make.width.mas_equalTo(@(self.imageRectWidth));
        }];

        UIView *contentView = [UIView new];
        [scrollView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.height.equalTo(scrollView);
        }];



        UIImageView *tempImageView = nil;

        for (int index = 0; index < dataArray.count; index ++) {

            UIImageView *orignalImageView = [[UIImageView alloc]init];
            [orignalImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orignalImageViewClick)]];
//            [orignalImageView sd_setImageWithURL:[NSURL URLWithString:dataArray[index]] placeholderImage:[UIImage imageNamed:dataArray[index]]];
            orignalImageView.userInteractionEnabled = YES;
            orignalImageView.tag = index;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orignalImageViewDidClick:)];
            [orignalImageView addGestureRecognizer:tap];
            int randomInt1 = arc4random() % 256;
            int randomInt2 = arc4random() % 256;
            int randomInt3 = arc4random() % 256;

            orignalImageView.backgroundColor = [UIColor colorWithRed:randomInt1/255.0 green:randomInt2/255.0 blue:randomInt3/255.0 alpha:1.0];
            [contentView addSubview:orignalImageView];

            [orignalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (tempImageView) {
                    make.left.mas_equalTo(tempImageView.mas_right).offset(8);
                }else{
                    make.left.mas_equalTo(contentView.mas_left).offset(16);
                }
                make.top.mas_equalTo(contentView.mas_top);
                make.height.mas_equalTo(contentView);
                make.width.mas_equalTo(@(size.width-32));
            }];

            UILabel *reasonLabel1 = [[UILabel alloc]init];
            reasonLabel1.text = [NSString stringWithFormat:@"第%@张图片...",@(index)];
            reasonLabel1.textColor = [UIColor whiteColor];
            reasonLabel1.textAlignment = NSTextAlignmentCenter;
            [orignalImageView addSubview:reasonLabel1];
            [reasonLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(orignalImageView.mas_bottom).offset(0);
                make.left.right.mas_equalTo(orignalImageView);
                make.height.mas_equalTo(@15);
            }];
            tempImageView = orignalImageView;
        }

        if (tempImageView != nil) {
            [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(tempImageView.mas_right);
            }];
        }

        self.currentPage = 0;
//        self.scrollView.contentSize = CGSizeMake(size.width * 3, size.height);

//        if (dataArray.count == 1 ) {
//            rightImageView.hidden = YES;
//            leftImageView.hidden = YES;
//            self.scrollView.contentSize = CGSizeMake(size.width * 1, size.height);
//        }else if (dataArray.count == 2) {
//            leftImageView.hidden = YES;
//            self.scrollView.contentSize = CGSizeMake(size.width * 2, size.height);
//        }

//        [self setImageByIndex:(int) self.currentPage array:self.imageUrls];
//        self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.currentImageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
//        [self.scrollView setContentOffset:CGPointMake(size.width, 0) animated:NO];
    }
    return self;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int currentPage = scrollView.contentOffset.x / pageWidth + 0.5;
//
//    self.currentPage = self.pageControl.currentPage;
//}

- (void)orignalImageViewDidClick:(UITapGestureRecognizer *)tap{

    NSLog(@"点击的是%zd个...",tap.view.tag);

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"偏移距离111....%f",scrollView.contentOffset.x);

//    CGFloat pageWidth = self.imageRectWidth;
//    int currentPage = scrollView.contentOffset.x / pageWidth + 0.5;
//    scrollView.contentOffset = CGPointMake(self.imageRectWidth * currentPage, 0);



}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSLog(@"偏移距离222....%f",scrollView.contentOffset.x);



    return;

    if (self.contentOffsetX < scrollView.contentOffset.x) {
        NSLog(@"应该显示下一个图片...");
//        currentPage = currentPage % self.imageUrls.count;
    }else if (self.contentOffsetX > scrollView.contentOffset.x){
        NSLog(@"应该显示上一个图片...1111");
        //        if (currentPage == 0) {
        //            currentPage = (int) self.imageUrls.count - 1;
        //        }
//        self.didScroll = YES;
//        currentPage =  (int)((currentPage - 1 + self.imageUrls.count) % self.imageUrls.count);

    }

//    if (self.didScroll && scrollView.contentOffset.x == 0) {
//        NSLog(@"应该显示上一个图片...2222");
//        if (self.currentPage == 0) {
//            currentPage = (int) self.imageUrls.count - 1;
//         }
//    }

    //如果是向左
    // 获取当前页数
//    if (currentPage == 0) {
//        currentPage = (int) self.imageUrls.count - 1;
//    }

//    NSInteger page = currentPage + 1;
//    if (currentPage == self.imageUrls.count -1) {
//        currentPage = 0;
//    }

//    if (scrollView.contentOffset.x  > pageWidth) { //显示右边区域
//
////        self.currentPage = ((self.currentPage + 1) % self.imageUrls.count);
//
//    }else if (scrollView.contentOffset.x < pageWidth){//显示左边区域
//
//        //防止currentIndex为0时，数组越界
//        self.currentPage = ((self.currentPage - 1 + self.imageUrls.count) % self.imageUrls.count);
//    }

//    NSLog(@"第%zd张...",currentPage);



//    self.contentOffsetX = scrollView.contentOffset.x;
//    self.currentPage = currentPage;

}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //    UIView *child = [super hitTest:point withEvent:event];

    //当前触点坐标系是self
    //转换成self.rightImage的坐标系
    CGPoint rightImagePoint = [self convertPoint:point toView:self.rightImageView];
    if ([self.rightImageView pointInside:rightImagePoint withEvent:event]) {//判断点击点是否在btn1上
        //如果点击点在btn1上 那么就让btn1来处理事件
        return self.rightImageView;
    }else{
        //如果不在btn1上 就按照系统默认做法  寻找合适的view来处理事件
        return [super hitTest:point withEvent:event];
    }
}




- (void)orignalImageViewClick{
    NSLog(@"orignalImageViewClick");
}

@end
