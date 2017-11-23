//
//  IDSGiftSmallLeftSideView.m
//  Near
//
//  Created by levi.duan on 2017/11/20.
//  Copyright © 2017年 Near. All rights reserved.
//

#import "IDSGiftSmallLeftSideView.h"
#import "IDSImageManager.h"
#import "IDSImageManager.h"

@implementation IDSGiftSmallLeftSideView

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
    [self addSubview:self.costomContentView];
}

- (void)initWithData:(IDSSmallGiftinfo *)model
{
    NSURL *picUrl = [NSURL URLWithString:model.avatarImageString];
    static UIImage *defImg;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defImg = [[IDSImageManager sharedManager] defaultAvatar:CircleStyle];
    });
    [self.avatarImageView sd_setImageWithURL:picUrl
                       placeholderImage:defImg
                                options:SDWebImageRetryFailed|SDWebImageLowPriority];
    
    self.giftImageView.image = IDSImageNamed(model.giftImageString);
    
    self.titleLabel.text = model.sendPersonName;
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.avatarImageView.frame)+5, 3, CGRectGetMinX(self.giftImageView.frame)-CGRectGetMaxX(self.avatarImageView.frame)-5, _titleLabel.contentSize.height);
    
    self.nameLabel.text = model.receivePersonName;
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.subLabel.frame)+5, CGRectGetMaxY(self.titleLabel.frame)+3, CGRectGetMinX(self.giftImageView.frame)-CGRectGetMaxX(self.subLabel.frame)-5, _nameLabel.contentSize.height);
}

- (UIView *)costomContentView
{
    if (!_costomContentView) {
        _costomContentView = [[UIView alloc] init];
        _costomContentView.backgroundColor = [UIColor clearColor];
        [_costomContentView addSubview:self.mainContentView];
        [_costomContentView addSubview:self.avatarImageView];
        [_costomContentView addSubview:self.giftImageView];
        [_costomContentView addSubview:self.titleLabel];
        [_costomContentView addSubview:self.subLabel];
        [_costomContentView addSubview:self.nameLabel];
    }
    return _costomContentView;
}

- (UIView *)mainContentView
{
    if (!_mainContentView) {
        _mainContentView = [[UIView alloc] init];
        _mainContentView.frame = CGRectMake(0, 0, 310/2.0, 70/2.0);
        _mainContentView.backgroundColor = [ColorUtil cl_colorWithHexString:Near_Final_Color_C25 alpha:.5f];
        _mainContentView.layer.borderColor = NF_Color_C29.CGColor;
        _mainContentView.layer.borderWidth = 0.5;
        _mainContentView.layer.cornerRadius = _mainContentView.bounds.size.height/2.0;
        _mainContentView.clipsToBounds = YES;
        _mainContentView.layer.masksToBounds = YES;
    }
    return _mainContentView;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
        _avatarImageView.image = IDSImageNamed(@"ic_room_choose");
        _avatarImageView.layer.cornerRadius = _avatarImageView.bounds.size.width/2.0;
        _avatarImageView.layer.borderColor = NF_Color_C1.CGColor;
        _avatarImageView.layer.borderWidth = 1;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarImageView;
}

- (UIImageView *)giftImageView
{
    if (!_giftImageView) {
        _giftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105, -3.5, 42, 42)];
        _giftImageView.layer.cornerRadius = _giftImageView.bounds.size.width/2.0;
        _giftImageView.layer.masksToBounds = YES;
        _giftImageView.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return _giftImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @" ";
        _titleLabel.textColor = NF_Color_C1;
        _titleLabel.font = [UIFont systemFontOfSize:Near_Final_Font_T3];
        [_titleLabel sizeToFit];
        _titleLabel.frame = CGRectMake(CGRectGetMaxX(self.avatarImageView.frame)+5, 3, CGRectGetMinX(self.giftImageView.frame)-CGRectGetMaxX(self.avatarImageView.frame)-5, _titleLabel.contentSize.height);
    }
    return _titleLabel;
}

- (UILabel *)subLabel
{
    if (!_subLabel) {
        _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avatarImageView.frame)+5 ,CGRectGetMaxY(self.titleLabel.frame)+3, 0, 0)];
        _subLabel.text = @"送给";
        _subLabel.textColor = NF_Color_C9;
        _subLabel.font = [UIFont systemFontOfSize:Near_Final_Font_T2];
        [_subLabel sizeToFit];
    }
    return _subLabel;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @" ";
        _nameLabel.textColor = NF_Color_C29;
        _nameLabel.font = [UIFont systemFontOfSize:Near_Final_Font_T2];
        [_nameLabel sizeToFit];
        _nameLabel.frame = CGRectMake(CGRectGetMaxX(self.subLabel.frame)+5, CGRectGetMaxY(self.titleLabel.frame)+3, CGRectGetMinX(self.giftImageView.frame)-CGRectGetMaxX(self.subLabel.frame)-5, _nameLabel.contentSize.height);
    }
    return _nameLabel;
}

@end
