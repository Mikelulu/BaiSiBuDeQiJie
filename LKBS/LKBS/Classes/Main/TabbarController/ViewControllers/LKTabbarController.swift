//
//  LKTabbarController.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

public class LKTabbarController: UITabBarController {


    // MARK: - 私有成员变量

    /// 控制器数组
    let vcs = [LKEssenceViewController(),LKFirstnewViewController(),LKAttentionViewController(),LKMineViewController()]

    /// 标题数组
    let titles = ["精华", "新帖", "关注", "我"]

    /// 正常图片数组
    let normalImgs = ["tabBar_essence_icon", "tabBar_new_icon", "tabBar_friendTrends_icon", "tabBar_me_icon"]

    /// 选中图片数组
    let selectedImgs = ["tabBar_essence_click_icon", "tabBar_new_click_icon", "tabBar_friendTrends_click_icon", "tabBar_me_click_icon"]


    // MARK: - 生命周期

    deinit {

        
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupChildVC()

        setTabbarItem()

        setupTabBar()

    }

}
// MARK: - 界面初始化
extension LKTabbarController {

    /// 添加子控制器
    fileprivate func setupChildVC() {

        for vc in vcs {

            self.addChildViewController(LKNavigationController.init(rootViewController: vc))
        }
        
    }

    /// 设置tabbarItem 
    fileprivate func setTabbarItem() {

        for index in 0..<titles.count {

            let vc = self.childViewControllers[index]

            vc.tabBarItem.title = titles[index]

            vc.tabBarItem.image = UIImage.init(named: normalImgs[index])

            vc.tabBarItem.selectedImage = UIImage.init(named: selectedImgs[index])?.withRenderingMode(.alwaysOriginal)

            vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : kSelectColor], for: .selected)
        }
    }

    /// 自定义tabbar
    fileprivate func setupTabBar() {

        self.tabBar.backgroundImage = UIImage.init(named: "tabbar-light")

        /// 利用KVC把readonly权限改过来
        self.setValue(LKTabBar(), forKey: "tabBar")
     }
}
