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
    
    var defaultQueue: GiftQueue = GiftQueue.default;
    
    /// MARK: - private
    private var queueDictionary:[String: GiftQueue] = [:];
    
    override init() {
        super.init();
        //self.defaultQueue.addObserver(self, forKeyPath: "giftList", options: [.new, .old], context: nil);
    }
    
    /// create a new queue
    ///
    /// - Parameters:
    ///   - name: queue name
    ///   - view: target view
    /// - Returns: one queue
    internal func createQueue(_ name: String? = nil, inView view: UIView? = nil) -> GiftQueue {
        // name is nil
        guard let queueName = name, name != "" else {
            return self.defaultQueue;
        }
        // already exist?
        guard let existQueue = queueDictionary[queueName] else {
            let queue = GiftQueue();
            queue.targetView = view;
            self.queueDictionary[queueName] = queue;
            return queue;
        }
        return existQueue;
    }

    internal func addGift(image: String, at startPoint: CGPoint, absolutePath: [[CGPoint]], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        if queueName == nil || queueName == "" {
            self.defaultQueue.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
        else {
            self.createQueue(queueName, inView: view).add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
            if queueDictionary[queueName!] == nil {
                queueDictionary[queueName!] = GiftQueue();
            }
            queueDictionary[queueName!]?.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
    }
    
//    internal func addGift(image: String, at startPoint: CGPoint, absolutePath: [PathPoint], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
//        if queueName == nil || queueName == "" {
//            self.defaultQueue.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
//        }
//        else {
//            self.createQueue(queueName, inView: view).add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
//            if queueDictionary[queueName!] == nil {
//                queueDictionary[queueName!] = GiftQueue();
//            }
//            queueDictionary[queueName!]?.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
//        }
//    }
    
    internal func addGift(image: String, at startPoint: CGPoint, relativePath: [[CGPoint]], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        if queueName == nil || queueName == "" {
            self.defaultQueue.add(image: image, at: startPoint, relativePath: relativePath, duration: duration);
        }
        else {
            if queueDictionary[queueName!] == nil {
                queueDictionary[queueName!] = GiftQueue();
                queueDictionary[queueName!]?.targetView = view;
            }
            queueDictionary[queueName!]?.add(image: image, at: startPoint, relativePath: relativePath, duration: duration);
        }
    }
}

// public
extension GiftQueueManager {
    /// stop all gift queue.
    func stopAllQueue() {
        self.defaultQueue.stop();
        for (_, queue) in self.queueDictionary {
            queue.stop();
        }
        self.queueDictionary.removeAll();
    }
}
