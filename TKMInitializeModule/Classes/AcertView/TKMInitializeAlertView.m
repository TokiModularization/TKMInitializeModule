//
//  TKMInitializeAlertView.m
//  TKMInitializeModule
//
//  Created by Thief Toki on 2021/3/26.
//

#import "TKMInitializeAlertView.h"

#import <TKMResourceManager/TKMResourceManager.h>

@interface TKMInitializeAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TKMInitializeAlertView

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
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageView];
    
    self.frame = CGRectMake((screenSize.width-100)/2, 100, 100, 120);
    self.titleLabel.frame = CGRectMake(0, 0, 100, 20);
    self.imageView.frame = CGRectMake(0, 20, 100, 100);
}

#pragma mark - setup UI response

- (void)setupUIResponse {
    UITapGestureRecognizer *tapGestureRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeFromSuperview)];
    [self.imageView addGestureRecognizer:tapGestureRecognizer];
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

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [TKMResourceManager imageNamed:@"logo"];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

@end
