//
//  TPStackMenu.h
//  TrafficPolice
//
//  Created by lihong on 14-5-1.
//  Copyright (c) 2014年 LiHong(410139419@qq.com). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TPStackMenuBlock)(NSInteger selectedMenuIndex);

@interface TPStackMenu : UIView

+ (instancetype)showStackMenuWithTitles:(NSArray *)titles
                      withImages:(NSArray *)images
                    atStartPoint:(CGPoint)startPoint
                          inView:(UIView *)parent
                      itemHeight:(CGFloat)itemHeight
                    onSelectMenu:(TPStackMenuBlock)block;

@end
