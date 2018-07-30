//
//  GiftQueue.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

public class GiftQueue: NSObject {
    /// singleton instance
    static let shared = {GiftQueue()}();
    
    // MARK: - properties
    @objc var giftList = NSMutableArray();
    public var targetView: UIView?;
    var isRunning = false;
    var count:Int { return self.giftList.count };
    
    override init() {
        super.init();
        self.addObserver(self, forKeyPath: "giftList", options: [.new, .old], context: nil);
    }
    
    // MARK: - public functions
    
    /// add one gift to queue.
    ///
    /// - Parameter object: git object
    public func add(object: GiftObject) {
        self.mutableArrayValue(forKey: "giftList").insert(object, at: 0);
    }
    
    /// stop the queue, clear all gift object.
    public func stop() {
        self.isRunning = false;
        self.removeAll();
    }
    
    
    /// pause the queue.
    public func pause() {
        self.isRunning = false;
    }
    
    /// start play the queue.
    public func start() {
        self.isRunning = true;
        self.next();
    }
    
    // MARK: - internal functions
    
    /// add a gift object, move with absolute path.
    ///
    /// - Parameters:
    ///   - image: image of the gift
    ///   - startPoint: start poing
    ///   - absolutePath: absolute path
    ///   - duration: duration of animation
    internal func add(image: String, at startPoint: CGPoint, absolutePath: [[CGPoint]], duration: CFTimeInterval) {
        self.mutableArrayValue(forKey: "giftList").insert(GiftObject(image: image, startPoint: startPoint, path: absolutePath, duration: duration, relative: false), at: 0);
    }
    
    /// add a gift object, move with relative path.
    ///
    /// - Parameters:
    ///   - image: image of the gift
    ///   - startPoint: start poing
    ///   - absolutePath: relative path
    ///   - duration: duration of animation
    internal func add(image: String, at startPoint: CGPoint, relativePath: [[CGPoint]], duration: CFTimeInterval) {
        self.mutableArrayValue(forKey: "giftList").insert(GiftObject(image: image, startPoint: startPoint, path: relativePath, duration: duration, relative: true), at: 0);
    }
    
    
    /// remove the last gift in list.
    internal func removeLast() {
        self.giftList.removeLastObject();
    }
    
    /// remove the gift at index.
    ///
    /// - Parameter index: index of object
    internal func remove(at index: Int) {
        self.giftList.removeObject(at: index);
    }
    
    /// remove all gift.
    internal func removeAll() {
        self.giftList.removeAllObjects();
    }
    
    /// play next gift.
    @objc func next() {
        guard self.count > 0 else {
            self.isRunning = false;
            return
        }
        //print("[AnimatedGift]the count of queue is \(self.count)");
        self.isRunning = true;
        if let gift = self.giftList.lastObject as? GiftObject {
            GiftAnimation.shared.play(gift, inView: self.targetView);
            self.removeLast();
            self.perform(#selector(next), with: nil, afterDelay: 0.1);
        }
    }
    
    /// KVO
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "giftList" {
            if !self.isRunning {
                self.next();
            }
        }
    }
}
