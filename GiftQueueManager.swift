//
//  GiftQueueManager.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

class GiftQueueManager: NSObject {
    var targetView: UIView? {
        didSet {
            self.defaultQueue.targetView = targetView;
        }
    };
    
    static let shared = {GiftQueueManager()}();
    
    var defaultQueue:GiftQueue = GiftQueue.shared;
    var tempQueues:[String: GiftQueue] = [:];
    //var isRunning = false;
    
    override init() {
        super.init();
        //self.defaultQueue.addObserver(self, forKeyPath: "giftList", options: [.new, .old], context: nil);
    }
    
    func createQueue(_ name: String? = nil, inView view: UIView? = nil) -> GiftQueue {
        guard let queueName = name else {
            return self.defaultQueue;
        }
        var queue:GiftQueue;
        if tempQueues[queueName] == nil {
            queue = GiftQueue();
            queue.targetView = view;
            self.tempQueues[queueName] = queue;
        }
        else {
            queue = self.tempQueues[queueName]!;
        }
        return queue;
    }

    func addGift(image: String, at startPoint: CGPoint, absolutePath: [[CGPoint]], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        if queueName == nil || queueName == "" {
            self.defaultQueue.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
        else {
            if tempQueues[queueName!] == nil {
                tempQueues[queueName!] = GiftQueue();
            }
            tempQueues[queueName!]?.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
    }
    
    func addGift(image: String, at startPoint: CGPoint, relativePath: [[CGPoint]], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        if queueName == nil || queueName == "" {
            self.defaultQueue.add(image: image, at: startPoint, relativePath: relativePath, duration: duration);
        }
        else {
            if tempQueues[queueName!] == nil {
                tempQueues[queueName!] = GiftQueue();
                tempQueues[queueName!]?.targetView = view;
            }
            tempQueues[queueName!]?.add(image: image, at: startPoint, relativePath: relativePath, duration: duration);
        }
    }
    
    func stopAllQueue() {
        self.defaultQueue.stop();
        for (_, queue) in tempQueues {
            queue.stop();
        }
        tempQueues.removeAll();
    }
}
