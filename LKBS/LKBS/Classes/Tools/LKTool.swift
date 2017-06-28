//
//  LKTool.swift
//  LKBS
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

struct LKTool{

    /// 将若干view等宽布局于容器containerView中
    ///
    /// - Parameters:
    ///   - views: viewArray
    ///   - containerView: 容器view
    ///   - superPadding:  距容器的左右边距
    ///   - viewPadding: 各view的左右边距
    public static func makeEqualWidthViews(_ views: [UIView], _ containerView: UIView, superPadding: CGFloat, viewPadding: CGFloat) {

        var lastView: UIView?

        for view: UIView in views {

            containerView.addSubview(view)

            if (lastView != nil) {
                view.snp.makeConstraints({ (make) in
                    make.top.equalTo(containerView)
                    make.left.equalTo(lastView!.snp.right).offset(viewPadding)
                    make.width.equalTo(lastView!)
                })
            }else {
                view.snp.makeConstraints({ (make) in
                    make.left.equalTo(containerView).offset(superPadding)
                    make.top.bottom.equalTo(containerView)
                })
            }
            lastView = view
        }

        lastView?.snp.makeConstraints({ (make) in
            make.right.equalTo(containerView).offset(-superPadding)
        })
    }
}
