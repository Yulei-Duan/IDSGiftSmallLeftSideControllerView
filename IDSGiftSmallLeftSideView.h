//
//  IDSGiftSmallLeftSideView.h
//  Near
//
//  Created by levi.duan on 2017/11/20.
//  Copyright © 2017年 Near. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "IDSPayModel.h"

@interface IDSGiftSmallLeftSideView : UIView

@property (nonatomic, strong) UIView *costomContentView;

@property (nonatomic, strong) UIView *mainContentView;

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UIImageView *giftImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subLabel;

@property (nonatomic, strong) UILabel *nameLabel;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)initWithData:(IDSSmallGiftinfo *)model;

@end
