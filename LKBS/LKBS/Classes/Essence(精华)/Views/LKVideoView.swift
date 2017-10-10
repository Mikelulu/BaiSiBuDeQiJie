//
//  LKVideoView.swift
//  LKBS
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import BMPlayer

class LKVideoView: LKCellContentView {

    private let maskV = UIView()
    
    private let player = BMPlayerLayerView()
    
    private var model: ListModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        maskV.backgroundColor = UIColor.black
        bgImageV.addSubview(maskV)
        maskV.addSubview(player)
        maskV.isHidden = true
        player.isHidden = true
        playBtn.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configVideo(model: ListModel) {
        self.model = model
        
        let urlString = model.video_thumbnail!
        playBtn.setImage(UIImage.init(named: "video-play"), for: .normal)

        
        bgImageV.kf.setImage(with: URL.init(string: urlString), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)

        playBtn.backgroundColor = UIColor.clear
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgImageV.snp.remakeConstraints({ (make) in
            
            make.edges.equalTo(UIEdgeInsets.zero)
        })
        
        playBtn.snp.remakeConstraints({ (make) in
            make.center.equalTo(bgImageV)
        })
        
        maskV.snp.remakeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        player.snp.remakeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    @objc fileprivate func play(_ btn: UIButton) {
        
        maskV.isHidden = false
        player.isHidden = false
        
        player.playURL(url: URL.init(string: self.model!.video_uri!)!)
    }
}
