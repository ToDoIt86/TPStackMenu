//
//  TPStackMenuItem.h
//  TrafficPolice
//
//  Created by lihong on 14-5-1.
//  Copyright (c) 2014年 LiHong(410139419@qq.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPStackMenuItem : UIView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image;

- (void)springEffect;
- (void)clickedEffect;
@end
