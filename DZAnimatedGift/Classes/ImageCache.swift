//
//  ImageCache.swift
//  DZAnimatedGift
//
//  Created by Yuhua Hu on 2018/3/13.
//

import UIKit

class ImageCache: NSObject {
    let imageCache:NSCache<NSString, AnyObject>;
    static let shared: ImageCache = {ImageCache()}();
    
    override init() {
        self.imageCache = NSCache<NSString, AnyObject>();
    }
    
//    open func imageData(withName name: String) -> Data {
//        
//        guard var data = self.imageCache.object(forKey: NSString(name)) else {
//            data = NSData(contentsOfFile: Bundle.main.path(forResource: name, ofType: "png"));
//            return data
//        }
//        
//        return data;
//    }
}
