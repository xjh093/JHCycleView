//
//  ViewController.m
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "JHCycleView.h"

@interface ViewController ()<JHCycleViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JHCycleView *cycleView = [[JHCycleView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)
                                                       textData:@[@"第1页",@"第2页",@"第3页",@"第4页"]];
    [self.view addSubview:cycleView];
    
    JHCycleView *cycleView1 = [[JHCycleView alloc] initWithFrame:CGRectMake(0, 220, CGRectGetWidth(self.view.frame), 100)
                                                       imageData:@[@"head1",@"head2",@"head3",@"head4",@"head5"]];
    [self.view addSubview:cycleView1];
    
    NSArray *urls = @[@"http://img.redocn.com/sheji/20141219/zhongguofengdaodeliyizhanbanzhijing_3744115.jpg",
                      @"http://pic31.nipic.com/20130801/11604791_100539834000_2.jpg",
                      @"http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg"];
    JHCycleView *cycleView2 = [[JHCycleView alloc] initWithFrame:CGRectMake(0, 340, CGRectGetWidth(self.view.frame), 100)
                                                       imageURLData:urls
                                                     holderImage:@"head2"];
    cycleView2.delegate = self;
    [self.view addSubview:cycleView2];
}

#pragma mark --- JHCycleViewDelegate

- (void)cycleView:(JHCycleView *)cycleView didSelectViewAtIndex:(NSInteger)index
{
    NSLog(@"index:%@",@(index));
}

@end
