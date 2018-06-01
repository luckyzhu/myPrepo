//
//  BBAEPreviewPhotoViewController.h
//  summary
//
//  Created by NewBoy on 2018/5/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PhotoBlock)(void);
@interface BBAEPreviewPhotoViewController : UIViewController

-(instancetype)initWithImage:(UIImage *)image;

@property (nonatomic,copy) PhotoBlock photoBlock;

@end
