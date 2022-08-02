//
//  ViewController.swift
//  DZAnimatedGift
//
//  Created by darkzero on 03/13/2018.
//  Copyright (c) 2018 darkzero. All rights reserved.
//

import UIKit

import DZAnimatedGift

class SimpleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap(_:))));
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        DZAnimatedGift.stopAllQueue();
        super.viewWillDisappear(animated);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onHeartButtonClicked(sender: UIButton) {
        DZAnimatedGift.stopQueue("tomato")
        let nodes = [
            PathNode(point: CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.6),
                     controlPoint: CGPoint(x:view.bounds.size.width*0.5, y:view.bounds.size.height*0.8)),
            PathNode(point: CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.3),
                     controlPoint: CGPoint(x:view.bounds.size.width*0.9, y:view.bounds.size.height*0.5))
        ]

        // simple sample with absolute path
        // use default queue
        DZAnimatedGift.addGift(image: "heart_pink", at: CGPoint(x:sender.frame.midX, y:sender.frame.midY), absolutePath: nodes, duration: drand48()+2.0)
    }
    
    @IBAction private func onTomatoButtonClicked(sender: UIButton) {
        let nodes = [
            PathNode(point: CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.6),
                     controlPoint: CGPoint(x:view.bounds.size.width*0.5, y:view.bounds.size.height*0.8)),
            PathNode(point: CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.3),
                     controlPoint: CGPoint(x:view.bounds.size.width*0.9, y:view.bounds.size.height*0.5))
        ]

        // simple sample with absolute path
        // use default queue
//        DZAnimatedGift.addGift(image: "tomato", at: CGPoint(x:sender.frame.midX, y:sender.frame.midY), absolutePath: nodes, duration: drand48()+2.0)
        
        
        // use custom queue
        let startPoint = CGPoint(x:sender.frame.midX, y:sender.frame.midY)
        let points = [
            PathNode(point: CGPoint(x:-10, y:-200), controlPoint: CGPoint(x:-60, y:-100)),
            PathNode(point: CGPoint(x:+10, y:-400))
        ]
        
        let tomato = GiftObject(image: "tomato",
                               startPoint: startPoint,
                               path: nodes,
                               duration: drand48()+2.0,
                               relative: false);
        let queue = DZAnimatedGift.createQueue(name: "tomato", inView: self.view);
        queue.add(object: tomato);
    }
    
    @objc func onTap(_ tap: UITapGestureRecognizer) {
        // simple sample with relative path
        // use custom queue
        let startPoint = tap.location(in: self.view);
        let points = [
            PathNode(point: CGPoint(x:-10, y:-200), controlPoint: CGPoint(x:-60, y:-100)),
            PathNode(point: CGPoint(x:+10, y:-400))
        ]
        
        let heart = GiftObject(image: "heart_pink",
                               startPoint: startPoint,
                               path: points,
                               duration: drand48()+1.0,
                               relative: true);
        let queue = DZAnimatedGift.createQueue(name: "fullScreenHeart", inView: self.view);
        queue.add(object: heart);
    }
}
