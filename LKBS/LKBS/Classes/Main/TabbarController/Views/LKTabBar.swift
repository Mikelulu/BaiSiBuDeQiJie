//
//  LKTabBar.swift
//  LKBS
//
//  Created by admin on 2017/6/19.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKTabBar: UITabBar {

    /// 中间的按钮
    let plusBtn = UIButton()


    override init(frame: CGRect) {

        super.init(frame: frame)


        plusBtn.setImage(UIImage.init(named: "tabBar_publish_icon"), for: .normal)
        plusBtn.setImage(UIImage.init(named: "tabBar_publish_click_icon"), for: .selected)

        plusBtn.sizeToFit()

        plusBtn.addTarget(self, action: #selector(plusBtnClick(_:)), for: .touchUpInside)
        addSubview(plusBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {

        super.layoutSubviews()

        var btnX: CGFloat = 0

        let btnW: CGFloat = self.bounds.width / CGFloat((self.items?.count)! + 1)
        let btnH: CGFloat = self.bounds.height

        var btnArr: Array<UIControl> = []

        for view: UIView in self.subviews {

//            LKLog(view)
            /**
             UITabBarButton 私有变量 ，知道了UITabBarButton之后
             
             &1. 可以直观的实时的检测UITabBarButton的情况,实时监控tabBar的状态;

             &2. 我们可以在不全部推倒tabBar重来的情况下,自定义UITabBarButton的位置,

            */
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                btnArr.append(view as! UIControl)
            }
        }

        for (index, btn) in btnArr.enumerated() {

            if index >= 2 {
                btnX =  CGFloat(index + 1) * btnW
            }else {
                btnX =  CGFloat(index) * btnW
            }

            btn.frame = CGRect.init(x: btnX, y: 0, width: btnW, height: btnH)
        }

        /// 设置中间按钮的位置
        plusBtn.center = CGPoint.init(x: self.bounds.size.width * 0.5, y: self.bounds.height * 0.5)
    }
}

// MARK: - 事件处理
extension LKTabBar {


    @objc fileprivate func plusBtnClick(_ btn: UIButton) {

        LKLog("点击了中间按钮")

        let publicVC = LKPublishViewController()

        UIApplication.shared.keyWindow?.rootViewController?.present(publicVC, animated: true, completion: nil)
        
    }
}
