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

        /*
         translucent设置后，原点在（0，64）处，bar不透明。
         同时，这个属性对navController下的所有视图控制器都起作用。
         */
//        UINavigationBar.appearance().isTranslucent = false



        /// 设置导航栏颜色 导航标题字体大小个颜色
//        UINavigationBar.appearance().barTintColor = kNavTinColor

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.white]

        /// 设置BarButtonItem的颜色以及字体大小
        UIBarButtonItem.appearance().setTitleTextAttributes( [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)], for: .normal)


        /// 去掉导航栏底部细线
        UINavigationBar.appearance().setBackgroundImage(UIImage.createImageWithColor(kNavTinColor, CGSize.init(width: kScreenW, height: 64)), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()

    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        if self.childViewControllers.count > 0 {
            /// 设置tabbar隐藏
            viewController.hidesBottomBarWhenPushed = true

            /// 设置返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.backItem(icon: "navigationButtonReturn", heightIcon: "navigationButtonReturnClick", target: self, action: #selector(back), title: "返回")
        }

        super.pushViewController(viewController, animated: animated)
    }


    @objc fileprivate func back() {

        self.popViewController(animated: true)
    }
    /// 设置状态栏的颜色为白色
    override var childViewControllerForStatusBarStyle: UIViewController? {

        get {
            return self.topViewController
        }
    }

}
