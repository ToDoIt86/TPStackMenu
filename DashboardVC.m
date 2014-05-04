//
//  DashboardVC.m
//  TrafficPolice
//
//  Created by lihong on 14-5-4.
//  Copyright (c) 2014年 LiHong(410139419@qq.com). All rights reserved.
//

#import "DashboardVC.h"
#import "TPStackMenu.h"

@interface DashboardVC ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end

@implementation DashboardVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeLeft|UIRectEdgeRight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

}

- (IBAction)show:(UIButton *)sender
{
    NSArray *titles = @[@"设置", @"百度搜索", @"推特", @"短消息", @"分享到微信朋友圈", @"发现更多"];

    [TPStackMenu showStackMenuWithTitles:titles
							  withImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"gear@2x.png"], [UIImage imageNamed:@"magnifier@2x.png"], [UIImage imageNamed:@"twitter@2x.png"], [UIImage imageNamed:@"speech@2x.png"], [UIImage imageNamed:@"actions@2x"], nil]
							atStartPoint:sender.center
								  inView:self.view
							  itemHeight:45
							onSelectMenu:^(NSInteger selectedMenuIndex) {
                                self.titleLable.text = titles[selectedMenuIndex];
                            }];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
