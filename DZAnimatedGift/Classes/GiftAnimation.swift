//
//  GiftAnimation.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

/// Gift Animation
class GiftAnimation: NSObject {
    static let shared: GiftAnimation = {GiftAnimation()}();
    
    func play(_ gift: GiftObject, inView view: UIView?) {
        let giftLayer = CALayer()
        giftLayer.contents = UIImage(named: gift.image)?.cgImage;
        giftLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        var movePath: UIBezierPath;
        if gift.relative {
            movePath = self.makeOffsetPath(from: gift.startPoint, withPath: gift.path);
        }
        else {
            movePath = self.makePath(from: gift.startPoint, withPath: gift.path);
        }
        
        var targetView = view;
        if  targetView == nil {
            targetView = UIApplication.shared.keyWindow?.rootViewController?.view as UIView!;
        }
        
        CATransaction.begin();
        CATransaction.setAnimationDuration(gift.duration);
        CATransaction.setCompletionBlock {
            giftLayer.removeFromSuperlayer();
        }
        
        let mvAnim = CAKeyframeAnimation(keyPath: "position")
        mvAnim.path = movePath.cgPath;
        mvAnim.repeatCount = 1;
        mvAnim.duration = gift.duration;
        
        let alphaAnim = CABasicAnimation(keyPath: "opacity")
        alphaAnim.fromValue = NSNumber(value: 1.0)
        alphaAnim.toValue   = NSNumber(value: 0.0)
        alphaAnim.duration = gift.duration;
        
        let anims = CAAnimationGroup();
        anims.duration = gift.duration;
        anims.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anims.animations = [mvAnim, alphaAnim];
        
        //anims.delegate = self;
        giftLayer.frame = CGRect(origin: CGPoint.zero, size: gift.size);
        giftLayer.opacity = 0;
        targetView!.layer.addSublayer(giftLayer);
        giftLayer.add(anims, forKey: "pathGuide");
        
        CATransaction.commit();
    }

    func makeOffsetPath(from startPoint: CGPoint, withPath points: [[CGPoint]]) -> UIBezierPath {
        let path = UIBezierPath();
        path.move(to: startPoint);
        for i in 0..<points.count {
            if points[i].count > 1 {
                path.addQuadCurve(to: startPoint.offset(by: points[i][0]), controlPoint: startPoint.offset(by: points[i][1]));
            }
            else {
                path.addLine(to: startPoint.offset(by: points[i][0]))
            }
        }
        return path;
    }
    
    func makePath(from startPoint: CGPoint, withPath points: [[CGPoint]]) -> UIBezierPath {
        let path = UIBezierPath();
        path.move(to: startPoint);
        for i in 0..<points.count {
            if points[i].count > 1 {
                path.addQuadCurve(to: points[i][0], controlPoint: points[i][1]);
            }
            else {
                path.addLine(to: points[i][0])
            }
        }
        return path;
    }
}

extension CGPoint {
    func offset(by dp: CGPoint) -> CGPoint {
        let ret = CGPoint(x: self.x + dp.x, y: self.y + dp.y);
        return ret;
    }
}
