//
//  ViewController.m
//  CircularProgressViewDemo
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino_saki.blog.163.com

#import "ViewController.h"
#import "CircularProgressView.h"

@interface ViewController () <CircularProgressDelegate>

@property (strong, nonatomic) CircularProgressView *circularProgressView;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)clickPlay:(id)sender;
- (IBAction)clickPause:(id)sender;
- (IBAction)clickRevert:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //get a audio path
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"In my song" ofType:@"mp3"];
   
    //set backcolor & progresscolor
    UIColor *backColor = [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
    UIColor *progressColor = [UIColor colorWithRed:82.0/255.0 green:135.0/255.0 blue:237.0/255.0 alpha:1.0];
    
    //alloc CircularProgressView instance
    self.circularProgressView = [[CircularProgressView alloc] initWithFrame:CGRectMake(41, 57, 238, 238)
                                                                  backColor:backColor
                                                              progressColor:progressColor
                                                                  lineWidth:30
                                                                  audioPath:audioPath];
    
    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
    
    //add CircularProgressView
    [self.view addSubview:self.circularProgressView];
    
    //set initial timeLabel
    self.timeLabel.text = [NSString stringWithFormat:@"00:00/%@",[self formatTime:(int)self.circularProgressView.player.duration]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlay:(id)sender {
    
    [self.circularProgressView play];
}

- (IBAction)clickPause:(id)sender {

    [self.circularProgressView pause];
}

- (IBAction)clickRevert:(id)sender {
    
    [self.circularProgressView revert];
}

#pragma mark Circular Progress View Delegate method
- (void)didUpdateProgressView{
    //update timelabel
    self.timeLabel.text = [NSString stringWithFormat:@"%@/%@",[self formatTime:(int)self.circularProgressView.player.currentTime],[self formatTime:(int)self.circularProgressView.player.duration]];
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
@end
