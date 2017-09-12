//
//  LKImageView.swift
//  LKBS
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKImageView: LKCellContentView {


    override init(frame: CGRect) {
        super.init(frame: frame)

        playBtn.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configImage(model: ListModel) {

        let height: CGFloat = kScreenW * model.image_height! / model.image_width!

        bgImageV.snp.makeConstraints({ (make) in
//            if height > kScreenH * 0.5 {
//                make.height.equalTo(200)
//            }else {
//
//                make.height.equalTo(height)
//            }
            make.height.equalTo(height)
            make.left.top.right.equalTo(0)
        })

        bgImageV.kf.setImage(with: URL.init(string: model.image_thumbnail_small!), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)

        //            playBtn.setBackgroundImage(UIImage.init(named: "ee-big-picture-background"), for: .normal)
        playBtn.backgroundColor = UIColor.gray
        playBtn.setImage(UIImage.init(named: "see-big-picture"), for: .normal)
        playBtn.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
        })
    }

    @objc fileprivate func play(_ btn: UIButton) {

    }


}
