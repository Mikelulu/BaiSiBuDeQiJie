//
//  LKCellContentView.swift
//  LKBS
//
//  Created by mac on 2017/7/29.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

enum Type: String {
    case audio
    case image
    case gif
    case video
    case text
}
class LKCellContentView: UIView {
    
    /// 
    fileprivate var bgImageV: UIImageView = UIImageView()
    fileprivate var playBtn: UIButton = UIButton()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LKCellContentView {
    
    /// 子视图
    fileprivate func setUpViews() {
        
        addSubview(bgImageV)
        bgImageV.addSubview(playBtn)
    }
    
    public func congigContent(type: Type, model: ListModel) {
        
        bgImageV.isUserInteractionEnabled = true
        
        playBtn.addTarget(setUpViews(), action: #selector(play(_:)), for: .touchUpInside)
        
        if type == .video || type == .audio {
            playBtn.isHidden = false
            bgImageV.isHidden = false

            var urlString: String
            if type == .video {
                urlString = model.video_thumbnail!
                playBtn.setImage(UIImage.init(named: "video-play"), for: .normal)
                
                playBtn.tag = 1000
                
                bgImageV.snp.makeConstraints({ (make) in
                    make.height.equalTo(kScreenW * model.video_height! / model.video_width!)
                    make.left.top.right.equalTo(0)
                })
            }else {
                urlString = model.audio_thumbnail!
                playBtn.setImage(UIImage.init(named: "playButtonPlay"), for: .normal)
                
                playBtn.tag = 1001
                
                bgImageV.snp.makeConstraints({ (make) in
                    make.height.equalTo(kScreenW * model.audio_height! / model.audio_width!)
                    make.left.top.right.equalTo(0)
                })
            }
            
            bgImageV.kf.setImage(with: URL.init(string: urlString), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            
            playBtn.backgroundColor = UIColor.clear
            playBtn.snp.makeConstraints({ (make) in
                make.center.equalTo(bgImageV)
            })
        }else if type == .image {
            playBtn.isHidden = false
            bgImageV.isHidden = false
            
            let height: CGFloat = kScreenW * model.image_height! / model.image_width!
            
            bgImageV.snp.makeConstraints({ (make) in
                if height > kScreenH * 0.5 {
                    make.height.equalTo(200)
                }else {
                    
                    make.height.equalTo(height)
                }
                make.left.top.right.equalTo(0)
            })
            
            bgImageV.kf.setImage(with: URL.init(string: model.image_thumbnail_small!), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            
            playBtn.tag = 1002
//            playBtn.setBackgroundImage(UIImage.init(named: "ee-big-picture-background"), for: .normal)
            playBtn.backgroundColor = UIColor.gray
            playBtn.setImage(UIImage.init(named: "see-big-picture"), for: .normal)
            playBtn.snp.makeConstraints({ (make) in
                make.bottom.equalTo(0)
                make.left.right.equalTo(0)
            })
        }else if type == .gif {
            playBtn.isHidden = false
            bgImageV.isHidden = false
            
            bgImageV.snp.makeConstraints({ (make) in
                make.height.equalTo(kScreenW * model.gif_height! / model.gif_width!)
                make.left.top.right.equalTo(0)
            })
            
            bgImageV.kf.setImage(with: URL.init(string: model.gif_thumbnail!), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            playBtn.setImage(UIImage.init(named: "common-gif"), for: .normal)
            playBtn.backgroundColor = UIColor.clear
            playBtn.snp.makeConstraints({ (make) in
                make.left.top.equalTo(0)
            })
        }
        else {
            playBtn.isHidden = true
            bgImageV.isHidden = true
        }
        
    }
    
    @objc fileprivate func play(_ btn: UIButton) {
        
    }
}
