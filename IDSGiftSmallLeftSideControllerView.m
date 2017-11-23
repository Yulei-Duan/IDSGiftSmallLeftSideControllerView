//
//  IDSGiftSmallLeftSideControllerView.m
//  Near
//
//  Created by levi.duan on 2017/11/21.
//  Copyright © 2017年 Near. All rights reserved.
//

#import "IDSGiftSmallLeftSideControllerView.h"

@implementation IDSGiftSmallLeftSideControllerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithView];
    }
    return self;
}

- (void)initWithView
{
    _queenArray = [NSMutableArray array];
    [self addSubview:self.leftViewUp];
    [self addSubview:self.leftViewDown];
    self.leftViewUp.alpha = 0;
    self.leftViewDown.alpha = 0;
    _leftViewUpPlaying = NO;
    _leftViewDownPlaying = NO;
    _playGifSwitch = NO;
    self.hidden = YES;
}

- (void)show:(IDSSmallGiftinfo *)model
{
    [_queenArray addObject:model];
    [self startPlay];
}

- (void)startPlay
{
    if (_playGifSwitch) {
        return;
    }
    if (_queenArray.count == 0) {
        self.hidden = YES;
        return;
    }
    self.hidden = NO;
    _playGifSwitch = YES;
    if (_queenArray.count > 0) {
        if (!_leftViewUpPlaying) {
            [self leftViewUpShow:_queenArray[_queenArray.count-1]];
            [_queenArray removeLastObject];
        }
        if (_queenArray.count == 0) {
            _playGifSwitch = NO;
            return;
        }
        if (!_leftViewDownPlaying) {
            [self leftViewDownShow:_queenArray[_queenArray.count-1]];
            [_queenArray removeLastObject];
        }
    }
    _playGifSwitch = NO;
}

- (void)leftViewUpShow:(IDSSmallGiftinfo *)model
{
    _leftViewUpPlaying = YES;
    [_leftViewUp initWithData:model];
    [self upLeftViewfadeInWithTime:0.5 leftView:self.leftViewUp];
}

- (void)leftViewDownShow:(IDSSmallGiftinfo *)model
{
    _leftViewDownPlaying = YES;
    [_leftViewDown initWithData:model];
    [self downLeftViewfadeInWithTime:0.5 leftView:self.leftViewDown];
}

- (IDSGiftSmallLeftSideView *)leftViewUp
{
    if (!_leftViewUp) {
        _leftViewUp = [[IDSGiftSmallLeftSideView alloc] initWithFrame:CGRectMake(0, 0, 310/2.0, 70/2.0)];
    }
    return _leftViewUp;
}

- (IDSGiftSmallLeftSideView *)leftViewDown
{
    if (!_leftViewDown) {
        _leftViewDown = [[IDSGiftSmallLeftSideView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.leftViewUp.frame)+15, 310/2.0, 70/2.0)];
    }
    return _leftViewDown;
}

//淡入
- (void)upLeftViewfadeInWithTime:(NSTimeInterval)time leftView:(IDSGiftSmallLeftSideView *)leftView{
    leftView.alpha = 0;
    
    [UIView animateWithDuration:time animations:^{
        leftView.alpha = 1;
    } completion:^(BOOL finished) {

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.2 animations:^{
                leftView.alpha = 0;
            } completion:^(BOOL finished) {
                _leftViewUpPlaying = NO;
                [self startPlay];
            }];
        });
        
    }];
}

- (void)downLeftViewfadeInWithTime:(NSTimeInterval)time leftView:(IDSGiftSmallLeftSideView *)leftView{
    leftView.alpha = 0;
    
    [UIView animateWithDuration:time animations:^{
        leftView.alpha = 1;
    } completion:^(BOOL finished) {

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.2 animations:^{
                leftView.alpha = 0;
            } completion:^(BOOL finished) {
                _leftViewDownPlaying = NO;
            }];
        });
    }];
}

@end
