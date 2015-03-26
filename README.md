# CircleAnimationView

####圆环放大效果，设置circleType为CircleTypeRing，效果如下：
```
CircleAnimationView *animationView = [[CircleAnimationView alloc] initWithFrame:CGRectMake(150, 200, 24, 24)];
animationView.circleType = CircleTypeRing;
[self.view addSubview:animationView];

```
![](https://raw.githubusercontent.com/cocoa-chen/CircleAnimationView/master/screenshot.gif)

####实心放大效果，设置circleType为CircleTypeRound，效果如下：
```
CircleAnimationView *animationView = [[CircleAnimationView alloc] initWithFrame:CGRectMake(150, 200, 24, 24)];
animationView.circleType = CircleTypeRound;
[self.view addSubview:animationView];

```
![](https://raw.githubusercontent.com/cocoa-chen/CircleAnimationView/master/screenshot2.gif)