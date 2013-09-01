//
//  CircularProgressView.m
//  CircularProgressView
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino.cn

#import "CircularProgressView.h"

@interface CircularProgressView ()<AVAudioPlayerDelegate>

@property (nonatomic) NSTimer *timer;
@property (nonatomic) AVAudioPlayer *player;//an AVAudioPlayer instance
@property (assign, nonatomic) float progress;

@end

@implementation CircularProgressView

- (id)initWithFrame:(CGRect)frame
          backColor:(UIColor *)backColor
      progressColor:(UIColor *)progressColor
          lineWidth:(CGFloat)lineWidth
          audioPath:(NSString *)path {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _backColor = backColor;
        _progressColor = progressColor;
        _lineWidth = lineWidth;
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
        _player.delegate = self;
        [_player prepareToPlay];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setAudioPath:(NSString *)audioPath{
    if (audioPath.length) {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:audioPath] error:nil];
        self.player.delegate = self;
        self.duration = self.player.duration;
        [self.player prepareToPlay];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //draw background circle
    UIBezierPath *backCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2)
                                                              radius:CGRectGetWidth(self.bounds) / 2 - self.lineWidth / 2
                                                          startAngle:(CGFloat) - M_PI_2
                                                            endAngle:(CGFloat)(1.5 * M_PI)
                                                           clockwise:YES];
    [self.backColor setStroke];
    backCircle.lineWidth = self.lineWidth;
    [backCircle stroke];
    
    if (self.progress) {
        //draw progress circle
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2)
                                                                      radius:CGRectGetWidth(self.bounds) / 2 - self.lineWidth / 2
                                                                  startAngle:(CGFloat) - M_PI_2
                                                                    endAngle:(CGFloat)(- M_PI_2 + self.progress * 2 * M_PI)
                                                                   clockwise:YES];
        [self.progressColor setStroke];
        progressCircle.lineWidth = self.lineWidth;
        [progressCircle stroke];
    }
}

- (void)updateProgressCircle{
    //update progress value
    self.progress = (float) (self.player.currentTime / self.player.duration);
    //redraw back & progress circles
    [self setNeedsDisplay];
    
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(CircularProgressViewDelegate)]) {
        [self.delegate updateProgressViewWithPlayer:self.player];
    }
}

- (void)play{
    
    if (!self.player.playing) {
        //alloc timer,interval:0.1 second
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateProgressCircle) userInfo:nil repeats:YES];
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:0.25]];
        [self.player play];
    }
}

- (void)pause{
    if (self.player.playing) {
        [self.timer invalidate];
        [self.player pause];
    }
}

- (void)stop{
    [self.player stop];
    self.player.currentTime = 0;
    [self updateProgressCircle];
}

#pragma mark AVAudioPlayerDelegate method
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (flag) {
        //invalid timer
        [self.timer invalidate];
        //restore progress value
        self.progress = 0;
        //self redraw
        [self setNeedsDisplay];
    }
}

@end
