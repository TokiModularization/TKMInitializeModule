//
//  TKMInitializeStartView.m
//  TKMInitializeModule
//
//  Created by Thief Toki on 2021/3/26.
//

#import "TKMInitializeStartView.h"

#import <Masonry/Masonry.h>
#import <TKMResourceManager/TKMResourceManager.h>
#import <TKMAccountModule/TKMAccountModule.h>

@interface TKMInitializeStartView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation TKMInitializeStartView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bindModel];
        [self setupUI];
        [self setupUIResponse];
    }
    return self;
}

#pragma mark - bind model

- (void)bindModel {
    
}

#pragma mark - setup UI

- (void)setupUI {
    [self addSubview:self.titleLabel];
    [self addSubview:self.startButton];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.centerX.equalTo(self);
    }];
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(100);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(100);
    }];
}

#pragma mark - setup UI response

- (void)setupUIResponse {
    [self.startButton addTarget:self
                        action:@selector(startButtonTapped)
              forControlEvents:UIControlEventTouchUpInside];
}

- (void)startButtonTapped {
    [self removeFromSuperview];
    
    [[TKModule shared] showLoginView];
}

#pragma mark - protocol

#pragma mark - setter

#pragma mark - getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Initialize";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startButton setImage:[TKMResourceManager imageNamed:@"logo"] forState:UIControlStateNormal];
    }
    return _startButton;
}

@end
