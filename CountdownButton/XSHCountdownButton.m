//
//  XSHCountdownButton.m
//  CQCountdownButton
//
//  Created by 轩辕辉 on 2018/3/19.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import "XSHCountdownButton.h"

@interface XSHCountdownButton ()
/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation XSHCountdownButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(cancelBtnHilightEffect) forControlEvents:UIControlEventAllTouchEvents];
    }
    return self;
}

#pragma mark 取消选中效果
-(void)cancelBtnHilightEffect{
    self.highlighted = NO;
}

#pragma mark 开始倒计时
-(void)startCountdown{
    if (self.timer) {
        [self releaseTimer];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshBtn) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)refreshBtn{
    self.countdowmTime --;
    if (self.countdowmTime == 0) {
        [self releaseTimer];
        self.enabled = YES;
        self.backgroundColor = [UIColor blueColor];
        [self setTitle:@"重新获取" forState:UIControlStateNormal];
    }else{
        self.enabled = NO;
        self.backgroundColor = [UIColor grayColor];
        NSString *title = [NSString stringWithFormat:@"%ld秒后重新获取", self.countdowmTime];
        [self setTitle:title forState:UIControlStateNormal];
    }
}

#pragma mark 释放倒计时
-(void)releaseTimer{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        NSLog(@"销毁定时器");
    }
}
@end
