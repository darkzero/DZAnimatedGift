# DZAnimatedGift

[![CI Status](http://img.shields.io/travis/darkzero/DZAnimatedGift.svg?style=flat)](https://travis-ci.org/darkzero/DZAnimatedGift)
[![Version](https://img.shields.io/cocoapods/v/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![License](https://img.shields.io/cocoapods/l/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![Platform](https://img.shields.io/cocoapods/p/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)

[English Ver.](./README.md)

## 示例程序

Clone本项目并进入Example文件夹，命令行运行pod install，然后打开DZAnimatedGift.xcworkspace文件即可

## 必须程序

XCode

## 安装

在你项目的Podfile中加入下面这行

```ruby
pod 'DZAnimatedGift'
```

## 使用例

#### 首先，引入Framework

```Swift
import DZAnimatedGift
```

#### 简单模式

在屏幕上显示一个移动的图片（基于绝对位置）

```Swift
DZAnimatedGift.addGift(image: "heart_pink",
                       at: CGPoint(x:sender.frame.midX, y:sender.frame.midY),
                       absolutePath: points,
                       duration: drand48()+2.0);
```

或者（基于相对位置）

```Swift
DZAnimatedGift.addGift(image: "heart_pink",
                       at: CGPoint(x:sender.frame.midX, y:sender.frame.midY),
                       relativePath: points,
                       duration: drand48()+2.0);
```

参数说明

```Swift
image: String               // 图片名
at: CGPoint                 // 移动的起始点
absolutePath: [[CGPoint]]   // 移动路径(绝对位置)
relativePath: [[CGPoint]]   // 移动路径(相对位置)
                            // [[CGPoint]]的形式如下
                            // [[endPoint, ctrlPoint], [endPoint, ctrlPoint], ...]
                            // 或只有endPoint如下
                            // [[endPoint], [endPoint], ...]
                            // 或者是混合如下
                            // [[endPoint, ctrlPoint], [endPoint], ...]
                            // endPoint表示这段移动的终点，ctrlPoint控制曲线的弯曲程度，没有ctrlPoint时则为直线移动
duration: CGFloat           // 移动动画的持续时间
```

#### 复杂模式

```Swift
let queue = DZAnimatedGift.createQueue(name: "QueueName", inView: self.view);
let width       = 64*[0.6, 0.8, 1.0, 1.2].random();
let duration    = 1.5*[0.7, 0.8, 0.9, 1.0, 1.2].random();
let g = GiftObject(image: "heart_pink",
                   startPoint: startPoint,
                   path: points,
                   duration: duration,
                   relative: true,
                   size: CGSize(width: width, height: width));
queue.add(object: g);
```

GiftObject.size可以自由控制每一个小图片的尺寸。
不同的QueueName动画不在一个队列，可以同屏同时出现数个动画Queue。
可参考Sample中的Complex多点触摸版本。

## Author

darkzero, darkzero_mk2@hotmail.com
iOS developer, working in Tokyo

## License

DZAnimatedGift is available under the MIT license. See the LICENSE file for more info.
