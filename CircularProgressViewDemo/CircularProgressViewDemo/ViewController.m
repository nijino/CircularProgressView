//
//  ViewController.m
//  CircularProgressViewDemo
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino.cn

#import "ViewController.h"
#import "CircularProgressView.h"
#import "ToggleButton.h"

@interface ViewController () <CircularProgressViewDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet ToggleButton *playOrPauseButton;

@property (unsafe_unretained, nonatomic) IBOutlet CircularProgressView *circularProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)clickPlayOrPause:(ToggleButton *)sender;
- (IBAction)clickStop:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.circularProgressView.backColor = [UIColor colorWithRed:236.0 / 255.0
                                                          green:236.0 / 255.0
                                                           blue:236.0 / 255.0
                                                          alpha:1.0];
    self.circularProgressView.progressColor = [UIColor colorWithRed:82.0 / 255.0
                                                              green:135.0 / 255.0
                                                               blue:237.0 / 255.0
                                                              alpha:1.0];
    self.circularProgressView.audioPath = [[NSBundle mainBundle] pathForResource:@"In my song"
                                                                          ofType:@"mp3"];
    
    self.circularProgressView.lineWidth = 20;
    
    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
    
    //set initial timeLabel
    self.timeLabel.text = [NSString stringWithFormat:@"00:00/%@",[self formatTime:(int)self.circularProgressView.duration]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlayOrPause:(ToggleButton *)sender {
    if (sender.on) {
        [self.circularProgressView play];
        self.circularProgressView.playOrPauseButtonIsPlaying = YES;
    }else {
        [self.circularProgressView pause];
        self.circularProgressView.playOrPauseButtonIsPlaying = NO;
    }
}

- (IBAction)clickStop:(id)sender {
    
    [self.circularProgressView stop];
    self.playOrPauseButton.on = NO;
    self.circularProgressView.playOrPauseButtonIsPlaying = NO;
    
}

#pragma mark Circular Progress View Delegate method
- (void)updateProgressViewWithPlayer:(AVAudioPlayer *)player {
    //update timeLabel
    self.timeLabel.text = [NSString stringWithFormat:@"%@/%@",[self formatTime:(int)player.currentTime],[self formatTime:(int)self.circularProgressView.duration]];
}

- (void)playerDidFinishPlaying{
    self.playOrPauseButton.on = NO;
}

//format audio time
- (NSString *)formatTime:(int)num{
    
    int sec = num % 60;
    int min = num / 60;
    if (num < 60) {
        return [NSString stringWithFormat:@"00:%02d",num];
    }
    return [NSString stringWithFormat:@"%02d:%02d",min,sec];
}

- (void)viewDidUnload {
    [self setTimeLabel:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotate{
    return YES;
}
@end
