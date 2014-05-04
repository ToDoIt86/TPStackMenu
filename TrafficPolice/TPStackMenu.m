//
//  TPStackMenu.m
//  TrafficPolice
//
//  Created by lihong on 14-5-1.
//  Copyright (c) 2014年 LiHong(410139419@qq.com). All rights reserved.
//

#import "TPStackMenu.h"
#import "TPStackMenuItem.h"

@interface TPStackMenu()
{
    UIWindow *_overlayWindow;
    NSMutableArray *_stackMenuItems;
    TPStackMenuBlock _stackMenuBlock;
}
@end

@implementation TPStackMenu

+ (instancetype)showStackMenuWithTitles:(NSArray *)titles
                      withImages:(NSArray *)images
                    atStartPoint:(CGPoint)startPoint
                          inView:(UIView *)parent
                      itemHeight:(CGFloat)itemHeight
                    onSelectMenu:(TPStackMenuBlock)block
{
    TPStackMenu *stackMenu =
    [[TPStackMenu alloc] initStackMenuWithTitles:titles
                                      withImages:images
                                    atStartPoint:startPoint
                                          inView:parent
                                      itemHeight:itemHeight
                                    onSelectMenu:block];
    [stackMenu show];
    
    return stackMenu;
}

- (instancetype)initStackMenuWithTitles:(NSArray *)titles
                             withImages:(NSArray *)images
                           atStartPoint:(CGPoint)startPoint
                                 inView:(UIView *)parent
                             itemHeight:(CGFloat)itemHeight
                           onSelectMenu:(TPStackMenuBlock)block
{
    self = [self initWithFrame:[UIScreen mainScreen].bounds];
    if(self)
    {
        NSUInteger minItemNumber = MIN(titles.count, images.count);
        self->_stackMenuBlock = [block copy];
        self->_stackMenuItems = [NSMutableArray arrayWithCapacity:minItemNumber];
        self.backgroundColor = [UIColor clearColor];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        startPoint = [self convertPoint:startPoint fromView:parent];
        [self removeFromSuperview];
        
        for(NSUInteger i = 0; i < minItemNumber; i++)
        {
            CGRect newRect  = CGRectMake(0,
                                         startPoint.y-itemHeight/2,
                                         startPoint.x+itemHeight/2,
                                         itemHeight);
            NSString *title = [titles objectAtIndex:i];
            UIImage  *image = [images objectAtIndex:i];
            
            TPStackMenuItem *stackMenuItem = [[TPStackMenuItem alloc] initWithFrame:newRect title:title image:image];
            stackMenuItem.alpha  = 0.0;

            [self addSubview:stackMenuItem];
            [self->_stackMenuItems addObject:stackMenuItem];
        }
    }
    
    return self;
}

- (void)show
{
    self->_overlayWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self->_overlayWindow addSubview:self];
    [self->_overlayWindow makeKeyAndVisible];
    self->_overlayWindow.backgroundColor = [UIColor clearColor];
    
    for(NSInteger i = 0; i < self->_stackMenuItems.count; i++)
    {
        TPStackMenuItem *stackMenuItem = self->_stackMenuItems[i];
        CGPoint center = stackMenuItem.center;
        center.y -= (i * stackMenuItem.bounds.size.height + stackMenuItem.bounds.size.height*1.2);
        center.x -= (i*8);
        
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            stackMenuItem.center = center;
            stackMenuItem.alpha = 1.0;
        } completion:^(BOOL finished) {
            [stackMenuItem springEffect];
        }];
    }
}

- (void)dismiss
{
    CGPoint center;
    
    for(NSInteger i = 0; i < self->_stackMenuItems.count; i++)
    {
        TPStackMenuItem *stackMenuItem = self->_stackMenuItems[i];
        if(i == 0) center = stackMenuItem.center;
        
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            stackMenuItem.alpha  = 0.0;
            stackMenuItem.center = center;
        } completion:^(BOOL finished) {
            stackMenuItem.hidden = YES;
           
            if(i == (self->_stackMenuItems.count - 1))
            {
                [self->_overlayWindow resignKeyWindow];
                self->_overlayWindow = nil;
            }
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}
@end
