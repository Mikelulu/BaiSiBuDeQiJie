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

        /**
         automaticallyAdjustsScrollViewInsets只是作用于scrollView上的，不管设不设置，原点都在（0，0）上，设置后只是更改了scrollView的contentOffset.y。
         同时，这个属性只对当前设置的控制器起作用。
         */
        self.automaticallyAdjustsScrollViewInsets = false


        /*
         edgesForExtendedLayout设置后，原点在（0，64）处，bar半透明。
         同时，该属性只对当前设置的控制器起作用。
         */
        //        self.edgesForExtendedLayout = .init(rawValue: 0)

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
