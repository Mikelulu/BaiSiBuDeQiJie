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
    public var bgImageV: UIImageView = UIImageView()
    public var playBtn: UIButton = UIButton()
    

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

        bgImageV.isUserInteractionEnabled = true

        addSubview(bgImageV)
        bgImageV.addSubview(playBtn)

    }
}
