#CircularProgressView

A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color,circle width as you wish.

##Preview
====================

![preview](https://github.com/nijino/CircularProgressView/blob/master/ScreenShot.png?raw=true)

##Installation
====================

1.Add AVFoundation.framework into your project.

2.Drop "CircularProgressView.h" & "CircularProgressView.m" into your project.

##Usage
====================

In your ViewController import the header file `CircularProgressView.h`, and create a CircularProgressView property to keep a reference:

`@property (nonatomic, strong) CircularProgressView *circularProgressView;`

Then, to create the object use a code like this:

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
====================

You can play,pause & revert audio by below methods declared in the header file `CircularProgressView.h`

```
- (void)play;
- (void)pause;
- (void)revert;
```

##Demo
====================

You can find a demo project in this repository.

##Requirements
====================

- iOS >= 4.3
- ARC

## Contact
====================

### nijino saki
- http://github.com/nijino
- http://www.weibo.com/nijinosaki

[My blog](http://nijino_saki.blog.163.com)