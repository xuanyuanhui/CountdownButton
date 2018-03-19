//
//  XSHCountdownButton.h
//  CQCountdownButton
//
//  Created by 轩辕辉 on 2018/3/19.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSHCountdownButton : UIButton
/** 倒计时时间 */
@property (nonatomic,assign) NSInteger countdowmTime;

/** 开始倒计时 */
-(void)startCountdown;
/** 消除定时器 */
-(void)releaseTimer;
@end
