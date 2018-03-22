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
        let points = [
            [CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.6), CGPoint(x:view.bounds.size.width*0.5, y:view.bounds.size.height*0.8)],
            [CGPoint(x:view.bounds.size.width*0.7, y:view.bounds.size.height*0.3), CGPoint(x:view.bounds.size.width*0.9, y:view.bounds.size.height*0.5)]];

        // simple sample
        DZAnimatedGift.addGift(image: "heart_pink", at: CGPoint(x:sender.frame.midX, y:sender.frame.midY), absolutePath: points, duration: drand48()+2.0);
    }
    
    @objc func onTap(_ tap: UITapGestureRecognizer) {
        let startPoint = tap.location(in: self.view);
        let points = [
            [CGPoint(x:-10, y:-200), CGPoint(x:-60, y:-100)],
            [CGPoint(x:+10, y:-400)]];
        
        let heart = GiftObject(image: "heart_pink",
                               startPoint: startPoint,
                               path: points,
                               duration: drand48()+2.0,
                               relative: true);
        let queue = DZAnimatedGift.createQueue(name: "fullScreenHeart", inView: self.view);
        queue.add(object: heart);
    }
}

extension Array
{
    func random() -> Element
    {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}

