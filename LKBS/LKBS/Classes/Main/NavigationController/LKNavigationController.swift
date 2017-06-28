//
//  LKNavigationController.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var childViewControllerForStatusBarStyle: UIViewController? {

        get {
            return self.topViewController
        }
    }

}
