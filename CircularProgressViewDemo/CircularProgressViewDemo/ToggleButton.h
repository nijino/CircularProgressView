//
//  ToggleButton.h
//  zwpg-ios
//  开关按钮，继承自UIButton
//  Created by 杨玉彬 on 13-4-27.
//  Copyright (c) 2013年 nijino. All rights reserved.
//  QQ:20118368
//  http://nijino.cn

#import <UIKit/UIKit.h>

@interface ToggleButton : UIButton

@property (assign, nonatomic, getter = isOn) BOOL on;//开关变量
@property (assign, nonatomic, getter = isToggleEnabled) BOOL toggleEnabled;//开关是否有效
@property (nonatomic) UIImage *onImage;//"开"状态图片
@property (nonatomic) UIImage *offImage;//"关"状态图片
@property (nonatomic) UIImage *onBackgroundImage;//"开"状态背景图片
@property (nonatomic) UIImage *offBackgroundImage;//"关"状态背景图片
@property (copy, nonatomic) NSString *onTitle;//"开"状态标题
@property (copy, nonatomic) NSString *offTitle;//"关"状态标题
@property (nonatomic) UIColor *onTitleColor;//"开"状态标题颜色
@property (nonatomic) UIColor *offTitleColor;//"关"状态标题颜色

//代码生成开关按钮类方法
+ (id)buttonWithOnImage:(UIImage *)onImage
               offImage:(UIImage *)offImage
       highlightedImage:(UIImage *)highlightedImage;

- (BOOL)toggle;//按动开关
@end
