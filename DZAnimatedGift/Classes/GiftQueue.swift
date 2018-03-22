//
//  GiftQueue.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

public class GiftQueue: NSObject {
    @objc var giftList = NSMutableArray();
    static let shared = {GiftQueue()}();
    
    public var targetView: UIView?;
    var isRunning = false;
    
    override init() {
        super.init();
        self.addObserver(self, forKeyPath: "giftList", options: [.new, .old], context: nil);
    }
    
    var count:Int {return self.giftList.count};
    
    // MARK: - public functions
    public func add(object: GiftObject) {
        self.mutableArrayValue(forKey: "giftList").insert(object, at: 0);
    }
    
    public func stop() {
        self.isRunning = false;
        self.removeAll();
    }
    
    public func pause() {
        self.isRunning = false;
    }
    
    public func start() {
        self.isRunning = true;
        self.next();
    }
    
    // MARK: - internal functions
    func add(image: String, at startPoint: CGPoint, absolutePath: [[CGPoint]], duration: CFTimeInterval) {
        self.mutableArrayValue(forKey: "giftList").insert(GiftObject(image: image, startPoint: startPoint, path: absolutePath, duration: duration, relative: false), at: 0);
    }
    
    func add(image: String, at startPoint: CGPoint, relativePath: [[CGPoint]], duration: CFTimeInterval) {
        self.mutableArrayValue(forKey: "giftList").insert(GiftObject(image: image, startPoint: startPoint, path: relativePath, duration: duration, relative: true), at: 0);
    }
    
    func removeLast() {
        self.giftList.removeLastObject();
    }
    
    func remove(at index: Int) {
        self.giftList.removeObject(at: index);
    }
    
    func removeAll() {
        self.giftList.removeAllObjects();
    }
    
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
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "giftList" {
            if !self.isRunning {
                self.next();
            }
        }
    }
}
