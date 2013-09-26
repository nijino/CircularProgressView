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
@property (assign, nonatomic) CGFloat angle;//angle between two lines

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
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:tapGesture];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:panGesture];
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
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:tapGesture];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:panGesture];
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
                                                              radius:(CGRectGetWidth(self.bounds) - self.lineWidth) / 2
                                                          startAngle:(CGFloat) - M_PI_2
                                                            endAngle:(CGFloat)(1.5 * M_PI)
                                                           clockwise:YES];
    [self.backColor setStroke];
    backCircle.lineWidth = self.lineWidth;
    [backCircle stroke];
    
    if (self.progress) {
        //draw progress circle
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2)
                                                                      radius:(CGRectGetWidth(self.bounds) - self.lineWidth) / 2
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
        [self.delegate playerDidFinishPlaying];
    }
}

- (void)handleGesture:(UIGestureRecognizer *)recognizer{
    CGPoint point = [recognizer locationInView:self];
    if (CGRectContainsPoint(self.bounds, point)) {
        [self pause];
        self.angle = [self angleFromStartToPoint:[recognizer locationInView:self]];
        self.player.currentTime = self.player.duration * (self.angle / (2 * M_PI));
        [self updateProgressCircle];
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            if (self.playOrPauseButtonIsPlaying) {
                [self play];
            }
        }
    }
}


//calculate angle between start to point
- (CGFloat)angleFromStartToPoint:(CGPoint)point{
    CGFloat angle = [self angleBetweenLinesWithLine1Start:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2) Line1End:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2 - 1) Line2Start:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2) Line2End:point];
    if (CGRectContainsPoint(CGRectMake(0, 0, CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame)), point)) {
        angle = 2 * M_PI - angle;
    }
    return angle;
}


//calculate angle between 2 lines
- (CGFloat)angleBetweenLinesWithLine1Start:(CGPoint)line1Start
                                  Line1End:(CGPoint)line1End
                                Line2Start:(CGPoint)line2Start
                                  Line2End:(CGPoint)line2End{
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    return acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
}
@end
