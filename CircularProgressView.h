//
//  CircularProgressView.h
//  CircularProgressView
//
//  Created by nijino saki on 13-3-2.
//  Copyright (c) 2013年 nijino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol CircularProgressDelegate;

@interface CircularProgressView : UIView

@property (strong, nonatomic) AVAudioPlayer *player;//an AVAudioPlayer instance
@property (assign, nonatomic) id <CircularProgressDelegate> delegate;

- (id)initWithFrame:(CGRect)frame
          backColor:(UIColor *)backColor
      progressColor:(UIColor *)progressColor
          lineWidth:(CGFloat)lineWidth
          audioPath:(NSString *)path;
- (void)play;
- (void)pause;
- (void)revert;


@end

@protocol CircularProgressDelegate <NSObject>

- (void)didUpdateProgressView;

@end