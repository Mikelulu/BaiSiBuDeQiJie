//
//  LKRecommentCell.swift
//  LKBS
//
//  Created by admin on 2017/7/12.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKRecommentCell: UITableViewCell {


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none

        setUpviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -私有属性
    /// 头像
    fileprivate lazy var headIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.layer.cornerRadius = 40 * 0.5
        //        imageV.layer.masksToBounds = true
        return imageV
    }()

    /// vip
    fileprivate lazy var vipIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.image = UIImage.init(named: "Profile_AddV_authen")
        return imageV
    }()

    /// 昵称
    fileprivate lazy var nickNameLb: UILabel = {

        let lable: UILabel = UILabel()
        lable.textColor = RGB(50, 152, 152)
        lable.font = UIFont.systemFont(ofSize: 15)
        return lable
    }()

    /// weiboVIP
    fileprivate lazy var weiboVipIV: UIImageView = {

        let imageV: UIImageView = UIImageView()
        imageV.image = UIImage.init(named: "nav_title_vip_icon")
        return imageV
    }()

    /// 时间
    fileprivate lazy var timeLb: UILabel = {

        let lable: UILabel = UILabel()
        lable.textColor = kNormalColor
        lable.font = UIFont.systemFont(ofSize: 13)
        return lable
    }()

    /// 右边的more
    fileprivate lazy var moreBtn: UIButton = {

        let btn: UIButton = UIButton()
        btn.setImage(UIImage.init(named: "cellmorebtnnormal"), for: .normal)

        return btn
    }()

    /// 文字内容
    fileprivate lazy var textLb: UILabel = {

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
    fileprivate lazy var commentView: UITableView = {

        let table = UITableView.init(frame: CGRect.zero, style: .plain)
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        //        table.delegate = self
        //        table.dataSource = self

        return table
    }()

    /// 底部的toolBar（）
    fileprivate lazy var toolBarV: LKToolBarView = {

        let view = LKToolBarView()
        return view
    }()

}
extension LKRecommentCell {

    fileprivate func setUpviews() {

        self.contentView.addSubview(headIV)
        self.contentView.addSubview(nickNameLb)
        self.contentView.addSubview(vipIV)
        self.contentView.addSubview(weiboVipIV)
        self.contentView.addSubview(timeLb)
        self.contentView.addSubview(moreBtn)
        self.contentView.addSubview(textLb)
//        self.contentView.addSubview(commentView)
//        self.contentView.addSubview(toolBarV)


        self.headIV.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(self.contentView).offset(kMargin)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }

        self.nickNameLb.snp.makeConstraints { (make) in
            make.left.equalTo(headIV.snp.right).offset(kMargin)
            make.top.equalTo(headIV)
        }

        self.vipIV.snp.makeConstraints { (make) in
            make.top.equalTo(headIV.snp.bottom).offset(-10)
            make.right.equalTo(headIV.snp.right).offset(-5)
        }

        self.weiboVipIV.snp.makeConstraints { (make) in
            make.centerY.equalTo(nickNameLb)
            make.left.equalTo(nickNameLb.snp.right).offset(kMargin)
        }
        self.timeLb.snp.makeConstraints { (make) in
            make.bottom.equalTo(headIV)
            make.left.equalTo(nickNameLb)
        }

        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-kMargin)
            make.centerY.equalTo(headIV)
        }

        self.textLb.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(headIV.snp.bottom).offset(kMargin)
            make.bottom.equalTo(-kMargin)
        }
//        self.textLb.preferredMaxLayoutWidth = kScreenW - 2 * kMargin

//        self.toolBarV.snp.makeConstraints { (make) in
//            make.bottom.equalTo(self.contentView).offset(-1)
//            make.size.equalTo(CGSize.init(width: kScreenW, height: 40))
//            make.left.equalTo(0)
//        }
    }
}

// MARK: - public method
extension LKRecommentCell {

    public func configCell(_ model: ListModel) {

        self.textLb.text = "如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作如果觉得我的文章对您有用，请随意赞赏。您的支持将鼓励我继续创作"

        self.headIV.backgroundColor = UIColor.red
        self.nickNameLb.text = "Michael"
        self.timeLb.text = "1小时前"
    }
}
