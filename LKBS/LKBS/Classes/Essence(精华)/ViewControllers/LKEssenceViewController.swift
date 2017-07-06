//
//  LKEssenceViewController.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKEssenceViewController: LKBaseViewController {

    /// 标题数组
    fileprivate let titles: [String] = ["推荐", "随听", "视频", "图片", "段子", "排行", "互动区", "网红", "社会", "投票", "美女", "冷知识", "游戏"]

    /// 控制器数组
    fileprivate let childVCs = [LKRecommendController(), LKWalkmanController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController()]


    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation()

        setUpViews()
    }

}

// MARK: - UI
extension LKEssenceViewController {

    fileprivate func setNavigation() {

        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "MainTitle"))

        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(icon: "nav_item_game_icon-1", heightIcon: "nav_item_game_click_icon-1", target: self, action: #selector(game))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.item(icon: "RandomAcross", heightIcon: "RandomAcrossClick", target: self, action: #selector(refresh))

        
    }
    fileprivate func setUpViews() {

        var pageStyle = LKPageStyle()
        /// 可以滚动
        pageStyle.isScrollEnable = true
        /// 设置缩放
        pageStyle.isNeedTitleScale = true

        let pageView: LKPageView = LKPageView.init(frame: CGRect.init(x: 0, y: 64, width: kScreenW, height: kScreenH - 64 - 49), titles: titles, titleStyle: pageStyle, childVCs: childVCs, parentVC: self)

        self.view.addSubview(pageView)
    }
}
// MARK: - 事件处理
extension LKEssenceViewController {

    @objc fileprivate func game() {

        LKLog("点击了" + NSStringFromClass(type(of: self)))
    }

    @objc fileprivate func refresh() {

        LKLog("点击了" + NSStringFromClass(type(of: self)))
    }
}
