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
//    fileprivate let childVCs = [LKRecommendController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController()]


    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        get {
            return false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation()

        setUpViews()
    }

    deinit {
        kDealloc(self)
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

        let segmentStyle = ZJSegmentStyle()
        /// 显示遮罩
        segmentStyle.isShowCover = true
        /// 关闭弹性
        segmentStyle.isSegmentViewBounces = false
        /// 颜色渐变
        segmentStyle.isGradualChangeTitleColor = true

        segmentStyle.segmentHeight = 44

        segmentStyle.normalTitleColor = RGBA(220, 220, 220, 1)
        segmentStyle.selectedTitleColor = RGB(250, 250, 250)

        let pageView: ZJScrollPageView = ZJScrollPageView.init(frame: CGRect.init(x: 0, y: 64, width: kScreenW, height: kScreenH - 64 - 49), segmentStyle: segmentStyle, titles: titles, parentViewController: self, delegate: self)

        self.view.addSubview(pageView)
    }
}

// MARK: - ZJScrollPageViewDelegate
extension LKEssenceViewController: ZJScrollPageViewDelegate {

    func numberOfChildViewControllers() -> Int {

        return self.titles.count
    }

    func childViewController(_ reuseViewController: UIViewController!, for index: Int) -> UIViewController! {

        LKLog(index)

        var childVC = reuseViewController

        if childVC == nil {
            childVC = LKRecommendController()
        }

        return childVC
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
