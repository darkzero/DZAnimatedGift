# DZAnimatedGift

[![CI Status](http://img.shields.io/travis/darkzero/DZAnimatedGift.svg?style=flat)](https://travis-ci.org/darkzero/DZAnimatedGift)
[![Version](https://img.shields.io/cocoapods/v/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![License](https://img.shields.io/cocoapods/l/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)
[![Platform](https://img.shields.io/cocoapods/p/DZAnimatedGift.svg?style=flat)](http://cocoapods.org/pods/DZAnimatedGift)

[中文版(制作中)]

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

#### at first, Import framework
```Swift
import DZAnimatedGift
```

#### Simple

Add one image to screen
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

About the Parameter
```Swift
image: String               // the image of gift
at: CGPoint                 // start point of the animation
absolutePath: [[CGPoint]]   // path of the animation(absolute in view)
relativePath: [[CGPoint]]   // path of the animation(relative of the start point)
                            // the [[CGPoint]] should be like
                            // [[endPoint, ctrlPoint], [endPoint, ctrlPoint], ...]
                            // or only endPoint like
                            // [[endPoint], [endPoint], ...]
                            // or mix
                            // [[endPoint, ctrlPoint], [endPoint], ...]
duration: CGFloat           // duration of the animation
```

#### Complex

## Author

darkzero, darkzero_mk2@hotmail.com
iOS developer, working in Tokyo

## License

DZAnimatedGift is available under the MIT license. See the LICENSE file for more info.
