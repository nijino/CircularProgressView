[![Build Status](https://travis-ci.com/nijino/CircularProgressView.svg?branch=master)](https://travis-ci.com/nijino/CircularProgressView)
# Introduction
A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color and circle width as you wish.  
![example pic][example pic]

# Latest Update
Now you can drag the progress to precise location to where it should to play.  

# Installation
1.Add AVFoundation.framework into your project.  
2.Drop "CircularProgressView.h" & "CircularProgressView.m" into your project.  

# Usage 
First in your ViewController import the header file `CircularProgressView.h`, and create a CircularProgressView property to keep a reference:  
`@property (nonatomic) CircularProgressView *circularProgressView;`  
Then you can create circular progress view by Interface Builder or by code.  

1.To create by using Interface Builder:  
Drop a UIView object into your xib or storyboard file, modify its class name to CircularProgressView:  
![xib example][xib example]  
then define circular progress view propertys in viewDidLoad method like this:  
```obj-c
    self.circularProgressView.backColor = [UIColor colorWithRed:236.0 / 255.0
                                                          green:236.0 / 255.0
                                                           blue:236.0 / 255.0
                                                          alpha:1.0];
    self.circularProgressView.progressColor = [UIColor colorWithRed:82.0 / 255.0
                                                              green:135.0 / 255.0
                                                               blue:237.0 / 255.0
                                                              alpha:1.0];
    self.circularProgressView.audioURL = [[NSBundle mainBundle] URLForResource:@"我的歌声里" withExtension:@"mp3"];

    self.circularProgressView.lineWidth = 20;

    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
```
2.To create the object using codes like this:  
```obj-c
    //get a audio path
    NSURL *audioURL = [[NSBundle mainBundle] URLForResource:@"我的歌声里" withExtension:@"mp3"];
    //set back color & progress color
    UIColor *backColor = [UIColor colorWithRed:236.0/255.0 
	       								 green:236.0/255.0 
			     						  blue:236.0/255.0 
				    					 alpha:1.0];
    UIColor *progressColor = [UIColor colorWithRed:82.0/255.0 
									       	green:135.0/255.0 
										     blue:237.0/255.0 
										    alpha:1.0];
    
    //alloc CircularProgressView instance
    self.circularProgressView = [[CircularProgressView alloc] initWithFrame:CGRectMake(41, 57, 238, 238) 
															  backColor:backColor 
														  progressColor:progressColor 
															  lineWidth:30 
															  audioURL:audioURL];
    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
    //add CircularProgressView
    [self.view addSubview:self.circularProgressView];
```
# API
You can play,pause & stop audio by below methods declared in the header file `CircularProgressView.h`  
```obj-c
- (void)play;
- (void)pause;
- (void)stop;
```
# Demo
You can find a demo project in this repository.  

# Version History  
* version 1.5  
Replace NSTimer with CADisplayLink.  

* version 1.4  
Update to supporting Xcode5.
Add animation to tap & drag gesture.  
 
* version 1.3  
Add response drag progress view gesture.  
  
* version 1.2  
Add initWithCoder method for creating instance from Interface Builder.  

* version 1.1  
Make code easy to read,add licenece and pics.  

* version 1.0  
Initial version.  

# Requirements 
- iOS >= 4.3
- ARC

# Contact
* Tech blog: <https://blog.csdn.net/nijino_saki>
* E-mail: nijino_saki@163.com
* Sina Weibo: [@iOS杨叫兽][]
* Twitter: [@yangyubin][]
* Facebook: [nijino_saki][]

[example pic]:http://ww3.sinaimg.cn/large/540e407ajw1ejko11y21cg208s0gc7a3.gif "example pic"
[xib example]:http://ww2.sinaimg.cn/large/540e407ajw1ejko543x1zj207f02bmx3.jpg "xib example"
[@iOS杨叫兽]:http://www.weibo.com/nijinosaki "iOS杨叫兽"
[@yangyubin]:https://twitter.com/yangyubin "欢迎在twitter上关注我"
[nijino_saki]:http://www.facebook.com/nijinosaki1982 "欢迎在facebook上关注我"


# 简介
一个iOS圆形进度条开源库，你可以定制它的大小、进度条背景色和前景色以及进度条的宽度。  
![example pic][example pic]

# 最新更新内容
现在支持拖拽进度以便精确控制播放进度。

# 安装方法
1.在工程项目中加入AVFoundation.framework & QuartzCore.framework框架。
2.将“CircularProgressView.h”和“CircularProgressView.m”文件拖拽至工程目录。

# 使用方法
首先在你的ViewController中导入`CircularProgressView.h`头文件并且新建一个圆形进度条属性来作为一个引用:  
`@property (nonatomic) CircularProgressView *circularProgressView;`  
之后你可以通过Interface Builder方式或者写代码的方式新建一个圆形进度条。

1.通过Interface Builder建立:  
在你的Xib或者故事版文件中放下一个UIView对象，修改它的类名为CircularProgressView:   
![xib example][xib example]  
之后如下方式在viewDidLoad方法中定义圆形进度条的属性:
```obj-c
    self.circularProgressView.backColor = [UIColor colorWithRed:236.0 / 255.0
                                                          green:236.0 / 255.0
                                                           blue:236.0 / 255.0
                                                          alpha:1.0];
    self.circularProgressView.progressColor = [UIColor colorWithRed:82.0 / 255.0
                                                              green:135.0 / 255.0
                                                               blue:237.0 / 255.0
                                                              alpha:1.0];
    self.circularProgressView.audioURL = [[NSBundle mainBundle] URLForResource:@"我的歌声里" withExtension:@"mp3"];

    self.circularProgressView.lineWidth = 20;

    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
```
2.用写代码的方式建立对象:
```obj-c
    //get a audio path
    NSURL *audioURL = [[NSBundle mainBundle] URLForResource:@"我的歌声里" withExtension:@"mp3"];
    //set back color & progress color
    UIColor *backColor = [UIColor colorWithRed:236.0/255.0 
	       								 green:236.0/255.0 
			     						  blue:236.0/255.0 
				    					 alpha:1.0];
    UIColor *progressColor = [UIColor colorWithRed:82.0/255.0 
									       	green:135.0/255.0 
										     blue:237.0/255.0 
										    alpha:1.0];
    
    //alloc CircularProgressView instance
    self.circularProgressView = [[CircularProgressView alloc] initWithFrame:CGRectMake(41, 57, 238, 238) 
															  backColor:backColor 
														  progressColor:progressColor 
															  lineWidth:30 
															  audioURL:audioURL];
    //set CircularProgressView delegate
    self.circularProgressView.delegate = self;
    //add CircularProgressView
    [self.view addSubview:self.circularProgressView];
```

# 提供接口
你可以通过如下方法播放、暂停或者停止音频，这些方法声明在`CircularProgressView.h`头文件中:
```obj-c
- (void)play;
- (void)pause;
- (void)stop;
```

# 示例
你可以在这个开源库中找到一个示例工程。

# 版本信息
* version 1.5  
用CADisplayLink替换NSTimer。

* version 1.4  
升级支持到Xcode5，加入点击与拖拽的手势动画。
 
* version 1.3  
加入对拖拽进度手势的响应。
  
* version 1.2  
加入对通过Interface Builder建立实例的初始化方法initWithCoder方法的支持。

* version 1.1  
让代码更易读，加入许可证和截图。

* version 1.0  
初始版本。

# 系统要求
- iOS >= 4.3
- ARC

# 联系方式
* Tech blog: <https://blog.csdn.net/nijino_saki>
* E-mail: nijino_saki@163.com
* Sina Weibo: [@iOS杨叫兽][]
* Twitter: [@yangyubin][]
* Facebook: [nijino_saki][]

[example pic]:http://ww3.sinaimg.cn/large/540e407ajw1ejko11y21cg208s0gc7a3.gif "example pic"
[xib example]:http://ww2.sinaimg.cn/large/540e407ajw1ejko543x1zj207f02bmx3.jpg "xib example"
[@iOS杨叫兽]:http://www.weibo.com/nijinosaki "iOS杨叫兽"
[@yangyubin]:https://twitter.com/yangyubin "欢迎在twitter上关注我"
[nijino_saki]:http://www.facebook.com/nijinosaki1982 "欢迎在facebook上关注我"
