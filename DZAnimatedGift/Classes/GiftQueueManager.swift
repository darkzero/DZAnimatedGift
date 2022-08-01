//
//  GiftQueueManager.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

public enum PathType: String {
    case absolute
    case relative
}

class GiftQueueManager: NSObject {
    var targetView: UIView? {
        didSet {
            self.defaultQueue.targetView = targetView;
        }
    };
    
    static let shared = { GiftQueueManager() }();
    
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
            return self.defaultQueue
        }
        // already exist?
        guard let existQueue = queueDictionary[queueName] else {
            let queue = GiftQueue()
            queue.targetView = view
            self.queueDictionary[queueName] = queue
            return queue
        }
        return existQueue
    }
    
    internal func addGift(image: String, at startPoint: CGPoint, pathType: PathType = .absolute, points: [PathNode], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        switch pathType {
        case .absolute:
            self.addGift(image: image, at: startPoint, absolutePath: points, duration: duration, toQueue: queueName, in: view)
            break
        case .relative:
            self.addGift(image: image, at: startPoint, relativePath: points, duration: duration, toQueue: queueName, in: view)
            break
        }
    }
    
    /// Add gift with absolute path
    /// - Parameters:
    ///   - image: image name
    ///   - startPoint: start point
    ///   - absolutePath: absolute path (points)
    ///   - duration: duration
    ///   - queueName: queueName (if nil, add to default queue)
    ///   - view: target view
    internal func addGift(image: String, at startPoint: CGPoint, absolutePath: [PathNode], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
        if queueName == nil || queueName == "" {
            self.defaultQueue.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
        else {
            //self.createQueue(queueName, inView: view).add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
            if queueDictionary[queueName!] == nil {
                queueDictionary[queueName!] = GiftQueue();
            }
            queueDictionary[queueName!]?.add(image: image, at: startPoint, absolutePath: absolutePath, duration: duration);
        }
    }
    
    ///  Add gift with relative path
    /// - Parameters:
    ///   - image: image name
    ///   - startPoint: start point
    ///   - relativePath: relative path (points)
    ///   - duration: duration
    ///   - queueName: queueName (if nil, add to default queue)
    ///   - view: target view
    internal func addGift(image: String, at startPoint: CGPoint, relativePath: [PathNode], duration: CFTimeInterval, toQueue queueName: String? = nil, in view: UIView? = nil) {
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
    // MARK: - For one queue
    
    /// Get queue with name
    /// - Parameter name: Queue name
    /// - Returns: GiftQueue ( return default queue if name is nil )
    func queue(_ name: String?) -> GiftQueue {
        if let n = name, let queue = queueDictionary[n] {
            return queue
        }
        return self.defaultQueue
    }
    
    /// Pause gift queue.
    /// - Parameter name: queue name
    func pauseQueue(_ name: String) {
        self.queue(name).pause()
        if let queue = self.queueDictionary[name] {
            queue.pause()
        }
    }
    
    /// Stop gift queue.
    /// - Parameter name: queue name
    func stopQueue(_ name: String) {
        if let queue = self.queueDictionary[name] {
            queue.stop()
            self.queueDictionary.removeValue(forKey: name)
        }
    }
    
    func startQueue(_ name: String) {
        self.queue(name).start()
    }
    
    // MARK: - For all queue
    
    /// Pause all gift queue.
    func pauseAllQueue() {
        self.defaultQueue.pause()
        for (_, queue) in self.queueDictionary {
            queue.pause()
        }
    }
    
    /// Stop all gift queue.
    func stopAllQueue() {
        self.defaultQueue.stop()
        for (_, queue) in self.queueDictionary {
            queue.stop()
        }
        self.queueDictionary.removeAll()
    }
    
    /// Start all gift queue.
    func startAllQueue() {
        self.defaultQueue.start()
        for (_, queue) in self.queueDictionary {
            queue.start()
        }
    }
}
