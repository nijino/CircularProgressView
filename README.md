![preview](https://github.com/nijino/CircularProgressView/blob/master/ScreenShot.gif?raw=true)

##Introduction
A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color and circle width as you wish.    

##Latest Update  
Now you can drag the progress to precise location to where it should to play.

##Installation
1.Add AVFoundation.framework into your project.  
2.Drop "CircularProgressView.h" & "CircularProgressView.m" into your project.

##Usage
First in your ViewController import the header file `CircularProgressView.h`, and create a CircularProgressView property to keep a reference:   
`@property (nonatomic) CircularProgressView *circularProgressView;`  
Then you can create circular progress view by interface builder or by code.  
1.To create by using interface builder:  
Drop a UIView object into your xib or storyboard file, modify its class name to CircularProgressView:   
 
![preview](https://github.com/nijino/CircularProgressView/blob/master/modifyclassname.png?raw=true)  

then define circular progress view propertys in viewDidLoad method like this:    

```
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
```

2.To create the object using codes like this:

```
//get a audio path
NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"In my song" ofType:@"mp3"];

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
															  audioPath:audioPath];

//set CircularProgressView delegate
self.circularProgressView.delegate = self;

//add CircularProgressView
 [self.view addSubview:self.circularProgressView];
 ```
 
##Methods
You can play,pause & stop audio by below methods declared in the header file `CircularProgressView.h`

```
- (void)play;
- (void)pause;
- (void)stop;
```

##Demo
You can find a demo project in this repository.    

##Version History   
- version 1.3  
Add response drag progress view gesture.
  
- version 1.2  
Add initWithCoder method for creating instance from interface builder.
 
- version 1.1  
Make code easy to read,add licenece and pics.   
 
- version 1.0   
Initial version.

##Requirements
- iOS >= 4.3
- ARC

## Contact
My tech blog:[http://nijino.cn](http://nijino.cn)  
Follw me on Sina Weibo:[@3G杨叫兽](http://www.weibo.com/nijinosaki)