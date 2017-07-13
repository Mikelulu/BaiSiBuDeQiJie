//
//  LKRecommentCell.swift
//  LKBS
//
//  Created by admin on 2017/7/12.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKRecommentCell: UITableViewCell {

    /// 头像
    lazy var headIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.layer.cornerRadius = 50 * 0.5
//        imageV.layer.masksToBounds = true
        return imageV
    }()

    /// vip
    lazy var vipIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.image = UIImage.init(named: "Profile_AddV_authen")
        return imageV
    }()

    /// 昵称
    lazy var nickNameLb: UILabel = {

        let lable: UILabel = UILabel()
        lable.textColor = RGB(50, 152, 152)
        lable.font = UIFont.systemFont(ofSize: 15)
        return lable
    }()

    /// weiboVIP 
    lazy var weiboVipIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.image = UIImage.init(named: "nav_title_vip_icon")
        return imageV
    }()

    /// 时间
    lazy var timeLb: UILabel = {

        let lable: UILabel = UILabel()
        lable.textColor = kNormalColor
        lable.font = UIFont.systemFont(ofSize: 13)
        return lable
    }()

    /// 右边的more
    lazy var moreBtn: UIButton = {

        let btn: UIButton = UIButton()
        btn.setImage(UIImage.init(named: "cellmorebtnnormal"), for: .normal)

        return btn 
    }()

    /// 文字内容
    lazy var textLb: UILabel = {

        let lable: UILabel = UILabel()
        lable.textColor = kNormalColor
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.numberOfLines = 0
        return lable
    }()

    /// image

    /// gif

    /// audio

    /// video

    /// 评论tableView
    lazy var commentTableView: UITableView = {

        let table = UITableView.init(frame: CGRect.zero, style: .plain)
        table.separatorStyle = .none
        table.tableFooterView = UIView()
//        table.delegate = self
//        table.dataSource = self

        return table
    }()

    /// 底部的toolBar（）
    lazy var toolBarV: LKToolBarView = {

        let view = LKToolBarView()
        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
