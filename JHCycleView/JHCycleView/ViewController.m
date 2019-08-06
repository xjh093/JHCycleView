//
//  ViewController.m
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "JHCycleView.h"

@interface ViewController ()

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
}

@end
