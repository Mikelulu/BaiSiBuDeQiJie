//
//  LKToolBarView.swift
//  LKBS
//
//  Created by admin on 2017/7/12.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKToolBarView: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)

        setUpviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension LKToolBarView {

    fileprivate func setUpviews() {

        /// 循环创建4个按钮

        let normalImages = ["mainCellDing", "mainCellCai", "mainCellShare", "mainCellComment"]
        let selectedImages = ["mainCellDingClick", "mainCellCaiClick", "mainCellShareClick", "mainCellCommentClick"]

        let titles = ["1230", "2345", "89", "100"]

        var lastBtn: UIButton?

        let btnWidth: CGFloat = (kScreenW - 3) / CGFloat(normalImages.count)
        let btnHeight: CGFloat = 40

        for index in 0..<normalImages.count {

            let btn: UIButton = UIButton()
            btn.setImage(UIImage.init(named: normalImages[index]), for: .normal)
            btn.setImage(UIImage.init(named: selectedImages[index]), for: .selected)
            btn.setTitle(titles[index], for: .normal)
            btn.setTitleColor(kNormalColor, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.tag = index

            if index == 0 || index == 2 {

                btn.titleEdgeInsets = UIEdgeInsetsMake(4, 5, 0, 0)
            }else {
                btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)
            }
            addSubview(btn)

            if (lastBtn != nil) {
                btn.snp.makeConstraints({ (make) in
                    make.left.equalTo((lastBtn?.snp.right)!).offset(1)
                    make.top.equalTo(lastBtn!)
                    make.size.equalTo(lastBtn!)
                })
            }else {
                btn.snp.makeConstraints({ (make) in
                    make.left.equalTo(self)
                    make.width.equalTo(btnWidth)
                    make.height.equalTo(btnHeight)
                    make.top.equalTo(self)
                })
            }
            lastBtn = btn
        }

        /// 创建3个分割线
        var lastLineLb: UILabel?

        let lineHeight: CGFloat = 30
        let lineWidth: CGFloat = 1

        for _ in 0..<3 {
            let lable: UILabel = UILabel()
            lable.backgroundColor = UIColor.gray

            addSubview(lable)
            if lastLineLb != nil {
                lable.snp.makeConstraints({ (make) in
                    make.top.equalTo(lastLineLb!)
                    make.size.equalTo(lastLineLb!)
                    make.left.equalTo(lastLineLb!.snp.right).offset(btnWidth)
                })
            }else {
                lable.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(self)
                    make.size.equalTo(CGSize.init(width: lineWidth, height: lineHeight))
                    make.left.equalTo(btnWidth)
                })
            }
            lastLineLb = lable
        }
    }
}
