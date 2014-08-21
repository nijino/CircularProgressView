//
//  CircularProgressView.h
//  CircularProgressView
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://www.nijino.cn

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol CircularProgressViewDelegate <NSObject>

@optional

- (void)updateProgressViewWithPlayer:(AVAudioPlayer *)player;
- (void)updatePlayOrPauseButton;
- (void)playerDidFinishPlaying;

@end

@interface CircularProgressView : UIView

@property (nonatomic) UIColor *backColor;
@property (nonatomic) UIColor *progressColor;
@property (nonatomic) NSURL *audioURL;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) BOOL playOrPauseButtonIsPlaying;
@property (nonatomic) id <CircularProgressViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame
          backColor:(UIColor *)backColor
      progressColor:(UIColor *)progressColor
          lineWidth:(CGFloat)lineWidth
           audioURL:(NSURL *)audioURL;

- (void)play;
- (void)pause;
- (void)stop;

@end