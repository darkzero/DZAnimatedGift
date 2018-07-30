//
//  DZAnimatedGift.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/20.
//

import UIKit

// MARK: - easy to use default queue
public class DZAnimatedGift: NSObject {
    
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
    
    public class func stopQueue(_ name: String) {
        //GiftQueueManager.shared.queue(name).stop();
    }
    
    public class func pauseQueue(_ name: String) {
        //GiftQueueManager.shared.queue(name).pause();
    }
    
    public class func startQueue(_ name: String) {
        //GiftQueueManager.shared.queue(name).start();
    }
    
    public class func stopAllQueue() {
        GiftQueueManager.shared.stopAllQueue();
    }
    
    public class func pauseAllQueue() {
        //GiftQueueManager.shared.pauseAllQueue();
    }
    
    public class func startAllQueue() {
        //GiftQueueManager.shared.startAllQueue();
    }
}

// MARK: - make new queue
extension DZAnimatedGift {
    /// create a gift queue
    ///
    /// - Parameters:
    ///   - name: queue name, if same as one is existed, will return that queue
    ///   - inView: target view
    /// - Returns: one queue
    public class func createQueue(name: String?=nil, inView: UIView?=nil) -> GiftQueue {
        let queue = GiftQueueManager.shared.createQueue(name, inView: inView);
        return queue;
    }
}
