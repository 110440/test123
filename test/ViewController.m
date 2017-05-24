//
//  ViewController.m
//  test
//
//  Created by tanson on 2017/5/24.
//  Copyright © 2017年 tanson. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic,strong) TestView * topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(TestView *)topView{
    if(!_topView){
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
        _topView = [[TestView alloc] initWithFrame:frame images:@[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"]]];
    }
    return _topView;
}

@end
