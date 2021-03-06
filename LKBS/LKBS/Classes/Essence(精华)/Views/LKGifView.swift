//
//  LKGifView.swift
//  LKBS
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKGifView: LKCellContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        playBtn.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configGif(model: ListModel) {

        bgImageV.kf.setImage(with: URL.init(string: model.gif_thumbnail!), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        playBtn.setImage(UIImage.init(named: "common-gif"), for: .normal)
        playBtn.backgroundColor = UIColor.clear
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageV.snp.remakeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        })
        playBtn.snp.remakeConstraints({ (make) in
            make.left.top.equalTo(0)
        })
    }
    @objc fileprivate func play(_ btn: UIButton) {
        
    }


}
