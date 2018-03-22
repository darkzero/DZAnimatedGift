//
//  DZAnimatedGift.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/20.
//

import UIKit

public class DZAnimatedGift: NSObject {
    
    // MARK: - easy to use
    
    
    /// Add a new gift to default queue, it will be auto played.
    ///
    /// - Parameter
    ///   - image: image of the gift
    ///   - at: the start point of the gift
    ///   - path: the path (Absolute position on screen)
    ///   - duration: duration
    public class func addGift(image: String, at startPoint: CGPoint, absolutePath: [[CGPoint]], duration: CFTimeInterval) {
        GiftQueueManager.shared.addGift(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
    }
    
    /// Add a new gift to default queue, it will be auto played.
    ///
    /// - Parameter
    ///   - image: image of the gift
    ///   - at: the start point of the gift
    ///   - offsetPath: the path (Relative to the starting point)
    ///   - duration: duration
    public class func addGift(image: String, at startPoint: CGPoint, relativePath: [[CGPoint]], duration: CFTimeInterval) {
        GiftQueueManager.shared.addGift(image: image, at: startPoint, relativePath: relativePath, duration: duration);
    }
    
    //
    public class func createQueue(name: String?=nil, inView: UIView?=nil) -> GiftQueue {
        let queue = GiftQueueManager.shared.createQueue(name, inView: inView);
        return queue;
    }
    
    public class func stopQueue(_ name: String) {
        
    }
    
    public class func pauseQueue(_ name: String) {
        
    }
    
    public class func startQueue(_ name: String) {
        
    }
    
    public class func stopAllQueue() {
        GiftQueueManager.shared.stopAllQueue();
    }
    
    public class func pauseAllQueue() {
        
    }
    
    public class func startAllQueue() {
        
    }
}
