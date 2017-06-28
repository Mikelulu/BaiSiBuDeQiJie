//
//  LKBaseViewController.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = kBgColor
    }


    /// 在Info.plist里面添加一行View controller-based status bar appearance ＝ NO 
    /// 或者是 导航控制器设置
    /// override var childViewControllerForStatusBarStyle: UIViewController? {

    ///    return self.topViewController
    /// }

    override var preferredStatusBarStyle: UIStatusBarStyle {

        get {
            return .lightContent
        }
    }

}

extension LKBaseViewController {


}
