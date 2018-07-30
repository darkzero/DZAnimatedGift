//
//  PathPoint.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/6/29.
//

import UIKit

/// PathPoint
public struct PathPoint {
    public var main: CGPoint!;
    public var control: CGPoint?;
    
    public init(_ main: CGPoint, control: CGPoint? = nil) {
        self.main       = main;
        self.control    = control;
    }
}
