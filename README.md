![example pic][example pic]  
##Introduction 简介
A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color and circle width as you wish.  
一个iOS圆形进度条开源库，你可以定制它的大小、进度条背景色和前景色以及进度条的宽度。

##Latest Update 最新更新内容
Now you can drag the progress to precise location to where it should to play.  
现在支持拖拽进度以便精确控制播放进度。

##Installation 安装方法
1.Add AVFoundation.framework into your project.  
1.在工程项目中加入AVFoundation.framework框架。

2.Drop "CircularProgressView.h" & "CircularProgressView.m" into your project.  
2.将“CircularProgressView.h“和”CircularProgressView.m“文件拖拽至工程目录。

##Usage 使用方法
First in your ViewController import the header file `CircularProgressView.h`, and create a CircularProgressView property to keep a reference:  
首先在你的ViewController中导入`CircularProgressView.h`头文件并且新建一个圆形进度条属性来作为一个引用:  
`@property (nonatomic) CircularProgressView *circularProgressView;`  
Then you can create circular progress view by Interface Builder or by code.  
之后你可以通过Interface Builder方式或者写代码的方式新建一个圆形进度条。

1.To create by using Interface Builder:  
1.通过Interface Builder建立:  
Drop a UIView object into your xib or storyboard file, modify its class name to CircularProgressView:  
在你的Xib或者故事版文件中放下一个UIView对象，修改它的类名为CircularProgressView:   
![xib example][xib example]  
then define circular progress view propertys in viewDidLoad method like this:  
之后如下方式在viewDidLoad方法中定义圆形进度条的属性:

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

2.To create the object using codes like this:  
2.用写代码的方式建立对象:

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

##Methods 方法
You can play,pause & stop audio by below methods declared in the header file `CircularProgressView.h`  
你可以通过如下方法播放、暂停或者停止音频，这些方法声明在`CircularProgressView.h`头文件中:

    - (void)play;
    - (void)pause;
    - (void)stop;

##Demo 示例
You can find a demo project in this repository.  
你可以在这个开源库中找到一个示例工程。

##Version History  版本信息
* version 1.5  
Replace NSTimer with CADisplayLink.  
用CADisplayLink替换NSTimer。

* version 1.4  
Update to supporting Xcode5.
Add animation to tap & drag gesture.  
升级支持到Xcode5，加入点击与拖拽的手势动画。
 
* version 1.3  
Add response drag progress view gesture.  
加入对拖拽进度手势的响应。
  
* version 1.2  
Add initWithCoder method for creating instance from Interface Builder.  
加入对通过Interface Builder建立实例的初始化方法initWithCoder方法的支持。

* version 1.1  
Make code easy to read,add licenece and pics.  
让代码更易读，加入许可证和截图。

* version 1.0  
Initial version.  
初始版本。

##Requirements 系统要求
- iOS >= 4.3
- ARC

## Contact 联系方式
* Tech blog:<http://www.nijino.cn>
* E-mail:nijino_saki@163.com
* Sina Weibo:[@3G杨叫兽][]
* Twitter:[@yangyubin][]
* Facebook:[nijino_saki][]

[example pic]:http://ww3.sinaimg.cn/large/540e407ajw1ejko11y21cg208s0gc7a3.gif "example pic"
[xib example]:http://ww2.sinaimg.cn/large/540e407ajw1ejko543x1zj207f02bmx3.jpg "xib example"
[@3G杨叫兽]:http://www.weibo.com/nijinosaki "3G杨叫兽"
[@yangyubin]:https://twitter.com/yangyubin "欢迎在twitter上关注我"
[nijino_saki]:http://www.facebook.com/nijinosaki1982 "欢迎在facebook上关注我"
