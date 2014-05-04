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
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));

    [TPStackMenu showStackMenuWithTitles:[NSArray arrayWithObjects:@"Setting", @"Search", @"Twitter", @"Message", @"Share", @"More ...", nil]
							  withImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"gear@2x.png"], [UIImage imageNamed:@"magnifier@2x.png"], [UIImage imageNamed:@"twitter@2x.png"], [UIImage imageNamed:@"speech@2x.png"], [UIImage imageNamed:@"actions@2x"], nil]
							atStartPoint:sender.center
								  inView:self.view
							  itemHeight:45
							onSelectMenu:^(NSInteger selectedMenuIndex) {
                                NSLog(@"menu index : %d", selectedMenuIndex);
                            }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
