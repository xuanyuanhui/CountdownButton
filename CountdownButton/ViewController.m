//
//  ViewController.m
//  CountdownButton
//
//  Created by 轩辕辉 on 2018/3/19.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import "ViewController.h"
#import "XSHCountdownButton.h"

@interface ViewController ()
/** 倒计时按钮 */
@property (nonatomic,strong) XSHCountdownButton *countdownBtn;

@end

@implementation ViewController
#pragma mark 懒加载
-(XSHCountdownButton *)countdownBtn{
    if (!_countdownBtn) {
        _countdownBtn = [[XSHCountdownButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
        [_countdownBtn setTitle:@"点击获取验证码" forState:UIControlStateNormal];
        _countdownBtn.backgroundColor = [UIColor blueColor];
        [_countdownBtn addTarget:self action:@selector(countdownBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countdownBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.countdownBtn];
}

#pragma mark 倒计时按钮点击事件
-(void)countdownBtnClick{
    //设置倒计时时间 开始计时
    self.countdownBtn.countdowmTime = 60;
    [self.countdownBtn startCountdown];
}

- (void)dealloc {
    //销毁计时器
    [self.countdownBtn releaseTimer];
}
@end
