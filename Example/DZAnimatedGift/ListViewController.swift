//
//  ListViewController.swift
//  DZAnimatedGift_Example
//
//  Created by Yuhua Hu on 2018/3/22.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    let titleList = ["Simple", "Complex"];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- UITableViewDataSource
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell");
        cell?.textLabel?.text = titleList[indexPath.row];
        return cell!;
    }
}

// MARK:- UITableViewDelegate
extension ListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "\(titleList[indexPath.row])Sample", sender: self);
    }
}
