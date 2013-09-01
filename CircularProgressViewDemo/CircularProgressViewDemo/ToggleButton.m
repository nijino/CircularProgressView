//
//  ToggleButton.m
//  zwpg-ios
//  开关按钮，继承自UIButton
//  Created by 杨玉彬 on 13-4-27.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino.cn

#import "ToggleButton.h"

@implementation ToggleButton

+ (instancetype)buttonWithOnImage:(UIImage *)onImage
               offImage:(UIImage *)offImage
       highlightedImage:(UIImage *)highlightedImage{
    ToggleButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.onImage = onImage;
    button.offImage = offImage;
    [button setImage:offImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    button.toggleEnabled = YES;
    return button;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.toggleEnabled = YES;
        
        self.onBackgroundImage = [self backgroundImageForState:UIControlStateSelected];
        self.offBackgroundImage = [self backgroundImageForState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateSelected];
        
        self.onImage = [self imageForState:UIControlStateSelected];
        self.offImage = [self imageForState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateSelected];
        
        self.onTitle = [self titleForState:UIControlStateSelected];
        self.offTitle = [self titleForState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateSelected];
        
        self.onTitleColor = [self titleColorForState:UIControlStateSelected];
        self.offTitleColor = [self titleColorForState:UIControlStateNormal];
        [self setTitleColor:nil forState:UIControlStateSelected];
    }
    return self;
}


#pragma mark - Toggle Support
- (BOOL)toggle{
    self.on = !self.on;
    return self.on;
}


- (void)setOn:(BOOL)onBool{
    if (_on != onBool) {
        _on = onBool;
        [self setBackgroundImage:(self.on ? self.onBackgroundImage : self.offBackgroundImage) forState:UIControlStateNormal];
        [self setImage:(self.on ? self.onImage : self.offImage) forState:UIControlStateNormal];
        [self setTitle:(self.on ? self.onTitle : self.offTitle) forState:UIControlStateNormal];
        [self setTitleColor:(self.on ? self.onTitleColor : self.offTitleColor) forState:UIControlStateNormal];
    }
}


//Detect a touchUpInside event and perform toggle if toggleEnabled = YES
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];
    if (self.touchInside && self.toggleEnabled) {
        [self toggle];
    }
}

@end
