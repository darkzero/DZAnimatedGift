//
//  GiftObject.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

/// Gift object
public struct GiftObject {
    var image: String;
    var startPoint: CGPoint;
    var path: [[CGPoint]];
    var duration: CFTimeInterval;
    var relative: Bool = false;
    var size: CGSize = CGSize(width: 48, height: 48);
    
    /// create a gift
    ///
    /// - Parameters:
    ///   - image: image of gift
    ///   - startPoint: start point
    ///   - path: movement path
    ///   - duration: duration of animation (default is 1 sec)
    ///   - relative: relative (default is true)
    ///   - size: gift size (default is (40,40))
    public init(image: String, startPoint: CGPoint, path: [[CGPoint]], duration: CFTimeInterval = 1.0, relative: Bool = false, size: CGSize = CGSize(width: 48, height: 48)) {
        self.image      = image;
        self.startPoint = startPoint;
        self.path       = path;
        self.duration   = duration;
        self.relative   = relative;
        self.size       = size;
    }
}
