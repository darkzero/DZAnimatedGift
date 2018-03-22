//
//  ComplexViewController.swift
//  DZAnimatedGift_Example
//
//  Created by Yuhua Hu on 2018/3/22.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import DZAnimatedGift

class ComplexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var i = 0;
        for touch in touches {
            let startPoint = touch.location(in: self.view);
            let points = [
                [CGPoint(x:-10, y:-200), CGPoint(x:-60, y:-100)],
                [CGPoint(x:+10, y:-400)]];
            print("touch\(i)")
            let queue = DZAnimatedGift.createQueue(name: "touch\(i)", inView: self.view);
            i += 1;
            let width       = 64*[0.6, 0.8, 1.0, 1.2].random();
            let duration    = 1.5*[0.7, 0.8, 0.9, 1.0, 1.2].random();
            let g = GiftObject(image: "heart_pink",
                               startPoint: startPoint,
                               path: points,
                               duration: duration,
                               relative: true,
                               size: CGSize(width: width, height: width));
            queue.add(object: g);
        }
    }
}
