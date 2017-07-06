//
//  LKPublishViewController.swift
//  LKBS
//
//  Created by admin on 2017/6/19.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import pop

class LKPublishViewController: LKBaseViewController {

    /// 背景的imageView
    public lazy var imageView: UIImageView = {

        let imgeV: UIImageView = UIImageView.init(frame: self.view.bounds)
        imgeV.image = UIImage.init(named: "shareBottomBackground")
        return imgeV
    }()

    fileprivate let titles = ["发视频","发图片","发段子","发声音","发链接","音乐相册"]
    fileprivate let imags = ["publish-video","publish-picture","publish-text","publish-audio","publish-link","publish-review"]

    fileprivate let animationDelay: CFTimeInterval = 0.1
    fileprivate let springBounciness: CGFloat = 15


    /// 顶部文字图片
    fileprivate let topImageV: UIImageView = UIImageView()

    /// 底部关闭按钮
    fileprivate let closeBtn: UIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(self.imageView)

        setUpViews()

        setBtns()
    }

    deinit {
        kDealloc(self)
    }
}

// MARK: - 添加子视图
extension LKPublishViewController  {

    /// 设置底部的关闭view
    fileprivate func setUpViews() {

        /// 关闭按钮
        self.closeBtn.setImage(UIImage.init(named: "tabbar_compose_background_icon_close"), for: .normal)

        self.closeBtn.frame = CGRect.init(x: 0, y: view.height - 40, width: view.width, height: 40)
        self.closeBtn.centerX = view.centerX
        view.addSubview(self.closeBtn)

        self.closeBtn.addTarget(self, action: #selector(dissMiss), for: .touchUpInside)
    }

    /// 设置中间的按钮以及顶部的view （按这个顺序添加子视图为了关闭的时候遍历子视图方便）
    fileprivate func setBtns() {

        let buttonW: CGFloat = 72
        let buttonH: CGFloat = buttonW + 10
        let maxCols: Int = 3
        let margin: CGFloat = 10
        let buttonStartX: CGFloat = 2 * margin
        let buttonXMargin: CGFloat = (kScreenW - CGFloat(maxCols) * buttonW - 2 * buttonStartX) * 0.5
        let buttonStartY: CGFloat = (kScreenH - 2 * buttonH) * 0.5

        for index in 0..<titles.count {
            let btn: LKTopButton = LKTopButton()
            btn.setImage(UIImage.init(named: imags[index]), for: .normal)
            btn.setTitle(titles[index], for: .normal)
            btn.tag = 1000
            btn.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)

            view.addSubview(btn)

            let buttonX: CGFloat = CGFloat(index % maxCols) * (buttonXMargin + buttonW) + buttonStartX
            let buttonY = CGFloat(index / maxCols) * (margin + buttonH) + buttonStartY

            let buttonBeginY = buttonY - kScreenH

            if let springAni: POPSpringAnimation = POPSpringAnimation.init(propertyNamed: kPOPViewFrame) {

                springAni.fromValue = NSValue.init(cgRect: CGRect.init(x: buttonX, y: buttonBeginY, width: buttonW, height: buttonH))
                springAni.toValue = NSValue.init(cgRect: CGRect.init(x: buttonX, y: buttonY, width: buttonW, height: buttonH))

                springAni.beginTime = CACurrentMediaTime() + CFTimeInterval(index) * animationDelay
                springAni.springBounciness = springBounciness

                btn.pop_add(springAni, forKey: "btn");

            }
        }

        /// 顶部的view
        self.topImageV.image = UIImage.init(named: "app_slogan")
        self.topImageV.frame = CGRect.init(x: 0, y: kScreenH * 0.15 - kScreenH, width: (self.topImageV.image?.size.width)!, height: (self.topImageV.image?.size.height)!)
        self.topImageV.centerX = self.view.centerX
        view.addSubview(self.topImageV)


        /// 1. 创建动画
        if let baseAnimation = POPSpringAnimation.init(propertyNamed: kPOPLayerPositionY) {

            baseAnimation.fromValue = kScreenH * 0.15 - kScreenH
            baseAnimation.toValue = kScreenH * 0.15
            baseAnimation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.imags.count) * animationDelay
            baseAnimation.springBounciness = springBounciness
            self.topImageV.layer.pop_add(baseAnimation, forKey: "position")
        }

    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.cancelCompletion {}

    }
    
}

// MARK: - 时间处理
extension LKPublishViewController {


    /// 关闭页面
    @objc fileprivate func dissMiss() {

        self.cancelCompletion {}

    }

    @objc fileprivate func btnClicked(_ btn: LKTopButton) {

        LKLog("点击了" + (btn.titleLabel?.text)!)
    }


    fileprivate func cancelCompletion(_ completion: @escaping () -> ()) {


        /// 遍历子视图
        for index in 2..<self.view.subviews.count {

            let currentView: UIView = self.view.subviews[index]

            if let baseAni: POPBasicAnimation = POPBasicAnimation.init(propertyNamed: kPOPViewCenter) {

                baseAni.toValue = NSValue.init(cgPoint: CGPoint.init(x: currentView.centerX, y: currentView.centerY + kScreenH))
                baseAni.beginTime = CACurrentMediaTime() + CFTimeInterval((index - 2)) * animationDelay
                currentView.pop_add(baseAni, forKey: "cancel")

                if index == self.view.subviews.count - 1 {
                    baseAni.completionBlock = {
                        (ani, true) in

                        self.dismiss(animated: true, completion: nil)

                        completion()
                    }
                }
            }


        }

    }
}
