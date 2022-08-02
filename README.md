# DZAnimatedGift

[![CI Status](http://img.shields.io/travis/darkzero/DZAnimatedGift.svg?style=flat)](https://travis-ci.org/darkzero/DZAnimatedGift)
[![Version](https://img.shields.io/cocoapods/v/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![License](https://img.shields.io/cocoapods/l/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![Platform](https://img.shields.io/cocoapods/p/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)

[中文版](./README_CN.md)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

XCode

## Installation

DZAnimatedGift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DZAnimatedGift'
```

## Sample

### at first, Import framework

```Swift
import DZAnimatedGift
```

### Simple

Add one image to screen, use default queue

```Swift
DZAnimatedGift.addGift(image: "heart_pink",
                       at: CGPoint(x:sender.frame.midX, y:sender.frame.midY),
                       absolutePath: points,
                       duration: drand48()+2.0);
```

or

```Swift
DZAnimatedGift.addGift(image: "heart_pink",
                       at: CGPoint(x:sender.frame.midX, y:sender.frame.midY),
                       relativePath: points,
                       duration: drand48()+2.0);
```

or

```Swift
DZAnimatedGift.addGift(image: String, 
                       at: CGPoint, 
                       path: [PathNode], 
                       type: .relative/.absolute, 
                       duration: drand48()+2.0)
```

### About the Parameter

```Swift
image: String               // the image of gift
at: CGPoint                 // start point of the animation
absolutePath: [PathNode]    // path of the animation(absolute in view)
relativePath: [PathNode]    // path of the animation(relative of the start point)
duration: CGFloat           // duration of the animation
```

**struct PathNode**
```Swift
PathNode
    var point: CGPoint!         // point
    var controlPoint: CGPoint?  // control point
```

![Simple](gif/simple.gif)

### Complex

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

![Complex](gif/complex.gif)

## Author

darkzero, darkzero_mk2@hotmail.com
iOS developer, working in Tokyo/Shanghai

[darkzero.me](https://darkzero.me)

## License

DZAnimatedGift is available under the MIT license. See the LICENSE file for more info.
