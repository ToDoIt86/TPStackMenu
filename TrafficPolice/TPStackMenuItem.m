//
//  TPStackMenuItem.m
//  TrafficPolice
//
//  Created by lihong on 14-5-1.
//  Copyright (c) 2014年 LiHong(410139419@qq.com). All rights reserved.
//

#import "TPStackMenuItem.h"

#define kTagIconImageView  20150504

@implementation TPStackMenuItem

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if(self)
    {
        CGSize selfSize = self.bounds.size;
        self.backgroundColor = [UIColor clearColor];
        
        CGRect newRect = CGRectMake(selfSize.width-selfSize.height, 0, selfSize.height, selfSize.height);
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:newRect];
        [iconImageView setImage:image];
        [iconImageView setTag:kTagIconImageView];
        iconImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [self addSubview:iconImageView];
        
        CGFloat cornerRadius = 5.0;
        UIFont *titleLableFont = [UIFont systemFontOfSize:15];
        CGSize titleSize = [title sizeWithFont:titleLableFont];
        titleSize.width  += (2*cornerRadius);
        titleSize.height += cornerRadius;
        newRect = CGRectMake(selfSize.width-selfSize.height-titleSize.width-5,
                             (selfSize.height-titleSize.height)/2,
                             titleSize.width,
                             titleSize.height);
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:newRect];
        titleLabel.font = titleLableFont;
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        titleLabel.layer.cornerRadius = cornerRadius;
        titleLabel.layer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
        [self addSubview:titleLabel];
        
        CGRect unionRect = CGRectUnion(iconImageView.frame, titleLabel.frame);
        newRect = self.frame;
        newRect.size = unionRect.size;
        newRect.origin.x = unionRect.origin.x;
        self.frame = newRect;
    }
    
    return self;
}

- (void)springEffect
{
    CABasicAnimation *scalAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scalAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scalAnimation.duration = 0.125;
    scalAnimation.repeatCount = 1;
    scalAnimation.autoreverses = YES;
    scalAnimation.removedOnCompletion = YES;
    scalAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)];
    
    CABasicAnimation *translationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    translationAnimation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    translationAnimation.duration = 0.125;
    translationAnimation.repeatCount = 1;
    translationAnimation.autoreverses = YES;
    translationAnimation.removedOnCompletion = YES;
    translationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 6, 0)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    [animationGroup setAnimations:@[scalAnimation,translationAnimation]];
    
    UIView *iconView = [self viewWithTag:kTagIconImageView];
    [iconView.layer addAnimation:animationGroup forKey:nil];
}

- (void)clickedEffect
{
    CABasicAnimation *scalAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scalAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scalAnimation.duration = 0.125;
    scalAnimation.repeatCount = 1;
    scalAnimation.autoreverses = YES;
    scalAnimation.removedOnCompletion = YES;
    scalAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1.0)];
    
    UIView *iconView = [self viewWithTag:kTagIconImageView];
    [iconView.layer addAnimation:scalAnimation forKey:nil];
}
@end
