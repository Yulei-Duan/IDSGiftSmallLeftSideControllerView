//
//  IDSGiftSmallLeftSideControllerView.h
//  Near
//
//  Created by levi.duan on 2017/11/21.
//  Copyright © 2017年 Near. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDSGiftSmallLeftSideView.h"
#import "IDSPayModel.h"

@interface IDSGiftSmallLeftSideControllerView : UIView

@property (nonatomic, strong) NSTimer *queryNoticeTimer;

@property (nonatomic, strong) IDSGiftSmallLeftSideView *leftViewUp;

@property (nonatomic, strong) IDSGiftSmallLeftSideView *leftViewDown;

@property (nonatomic, assign) BOOL leftViewUpPlaying;

@property (nonatomic, assign) BOOL leftViewDownPlaying;

@property (nonatomic, assign) BOOL playGifSwitch;

@property (nonatomic, strong) NSMutableArray *queenArray;

- (void)show:(IDSSmallGiftinfo *)model;

@end
