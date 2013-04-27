//
//  CircularProgressView.m
//  CircularProgressView
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino_saki.blog.163.com

#import "CircularProgressView.h"

@interface CircularProgressView ()<AVAudioPlayerDelegate>

@property (strong, nonatomic) UIColor *backColor;
@property (strong, nonatomic) UIColor *progressColor;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) float progress;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation CircularProgressView

- (id)initWithFrame:(CGRect)frame
          backColor:(UIColor *)backColor
      progressColor:(UIColor *)progressColor
          lineWidth:(CGFloat)lineWidth
          audioPath:(NSString *)path
{
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

- (void)drawRect:(CGRect)rect
{
    //draw background circle
    UIBezierPath *backCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                              radius:self.bounds.size.width / 2 - self.lineWidth / 2
                                                          startAngle:(CGFloat) - M_PI_2
                                                            endAngle:(CGFloat)(1.5 * M_PI)
                                                           clockwise:YES];
    [self.backColor setStroke];
    backCircle.lineWidth = self.lineWidth;
    [backCircle stroke];
    
    if (self.progress != 0) {
        //draw progress circle
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                                      radius:self.bounds.size.width / 2 - self.lineWidth / 2
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
    
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(CircularProgressDelegate)]) {
        [self.delegate didUpdateProgressView];
    }
}

- (void)play{
    
    if (!self.player.playing) {
        //alloc timer,interval:0.1 second
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateProgressCircle) userInfo:nil repeats:YES];
        [self.timer fire];
        [self.player play];
    }
}

- (void)pause{
    if (self.player.playing) {
        [self.timer invalidate];
        [self.player pause];
    }
}

- (void)revert{
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
