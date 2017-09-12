//
//  LKAudioView.swift
//  LKBS
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKAudioView: LKCellContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        playBtn.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configAudio(model: ListModel) {

        let urlString = model.audio_thumbnail!
        playBtn.setImage(UIImage.init(named: "playButtonPlay"), for: .normal)

        bgImageV.snp.makeConstraints({ (make) in
            make.height.equalTo(kScreenW * model.audio_height! / model.audio_width!)
            make.left.top.right.equalTo(0)
        })
        bgImageV.kf.setImage(with: URL.init(string: urlString), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)

        playBtn.backgroundColor = UIColor.clear
        playBtn.snp.makeConstraints({ (make) in
            make.center.equalTo(bgImageV)
        })

    }

    @objc fileprivate func play(_ btn: UIButton) {

    }

}
