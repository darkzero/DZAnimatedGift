//
//  GiftObject.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

public struct GiftObject {
    var image: String;
    var startPoint: CGPoint;
    var path: [[CGPoint]];
    var duration: CFTimeInterval;
    var relative: Bool = false;
    var size: CGSize = CGSize(width: 48, height: 48);
    
    public init(image: String, startPoint: CGPoint, path: [[CGPoint]], duration: CFTimeInterval, relative: Bool = false, size: CGSize = CGSize(width: 48, height: 48)) {
        self.image      = image;
        self.startPoint = startPoint;
        self.path       = path;
        self.duration   = duration;
        self.relative   = relative;
        self.size       = size;
    }
}
