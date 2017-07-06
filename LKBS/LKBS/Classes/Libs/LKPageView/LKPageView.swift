//
//  LKPageView.swift
//  LKBS
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKPageView: UIView {

    fileprivate var titles : [String]
    fileprivate var childVCs : [UIViewController]
    fileprivate var parentVC : UIViewController
    fileprivate var titleStyle : LKPageStyle

    init(frame: CGRect,titles : [String],titleStyle : LKPageStyle,childVCs : [UIViewController],parentVC : UIViewController) {
        self.titles = titles
        self.childVCs = childVCs
        self.parentVC = parentVC
        self.titleStyle = titleStyle

        super.init(frame: frame)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LKPageView{
    fileprivate func setupUI(){
        let titleViewFrame = CGRect(x: 0, y: 0, width: bounds.width, height: titleStyle.titleViewHeight)
        let titleView = LKTitleView(frame:titleViewFrame,titles:titles,style:titleStyle)
        titleView.backgroundColor = kNavTinColor
        addSubview(titleView)

        let contentFrame = CGRect(x: 0, y: titleViewFrame.maxY, width: bounds.width, height: bounds.height - titleStyle.titleViewHeight)
        let contentView = LKContentView(frame: contentFrame, childVCs: childVCs, parentVC: parentVC)
//        contentView.backgroundColor = .red
        addSubview(contentView)


        //titleView与contentView进行协作
        //MARK:- 代理 1
        titleView.delegate = contentView

        //MARK:- 代理的使用 1
        contentView.delegate = titleView
    }
}
