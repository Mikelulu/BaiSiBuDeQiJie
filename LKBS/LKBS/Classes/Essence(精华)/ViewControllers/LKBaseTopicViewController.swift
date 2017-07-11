//
//  LKBaseTopicViewController.swift
//  LKBS
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import SVProgressHUD
import ObjectMapper
import MJRefresh

class LKBaseTopicViewController: LKBaseViewController {

    /// 加载页数
    fileprivate var page: Int = 0

    /// 数据源
    fileprivate var dataSource = [ListModel]()

    /// 请求url
    public var urlString: String = "" {

        didSet {
            /// 进行网络请求
            self.tableView.mj_header.beginRefreshing()
        }
    }
    /// 是否有banner
    public var isShowBanner: Bool = false {

        didSet {

            if self.isShowBanner {

                let imagUrls: [String] = [
                                        "http://img.spriteapp.cn/spritead/20170531/185026958423.jpg",
                                        "http://img.spriteapp.cn/spritead/20170531/185139989275.jpg",
                                        "http://img.spriteapp.cn/spritead/20170531/185540702503.jpg",
                                        "http://img.spriteapp.cn/spritead/20170612/194445627195.jpg",
                                        "http://img.spriteapp.cn/spritead/20170531/185217240322.jpg"]

                /// 设置头视图
                let bannerView: SDCycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 200), imageURLStringsGroup: imagUrls)
                bannerView.loadImageBlock = {
                    (imageView, imageUrl, placeholderImag) in

                    imageView?.kf.setImage(with: imageUrl, placeholder: placeholderImag, options: nil, progressBlock: nil, completionHandler: nil)
                }
                bannerView.placeholderImage = UIImage.init(named: "adph1")

                bannerView.clickItemOperationBlock = {
                    index in

                    LKLog("点击了第\(index)张图片")
                }
                tableView.tableHeaderView = bannerView
            }
        }
    }

    //// tableView
    fileprivate lazy var tableView: UITableView = {

        let table: UITableView = UITableView.init(frame: self.view.bounds, style: .plain)
        table.tableFooterView = UIView()
        table.separatorInset = UIEdgeInsets.zero
        table.delegate = self
        table.dataSource = self

        return table
    }()

    // MARK: - liftStyle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = kBgColor

        view.addSubview(self.tableView)

        /// 添加下拉刷新
        self.tableView.mj_header = MJRefreshHeader.init(refreshingBlock: { [unowned self] in
            let url: String = String.init(format: self.urlString, 0)
            LKLog("请求的url为:" + url)
            self.getData(url, isLoadMore: false)
        })

        /// 添加上拉加载更多
        self.tableView.mj_footer = MJRefreshAutoFooter.init(refreshingBlock: { [unowned self] in

            let url: String = String.init(format: self.urlString, self.page + 1)
            LKLog("请求的url为:" + url)
            self.getData(url, isLoadMore: true)
        })
    }

}

// MARK: - Network
extension LKBaseTopicViewController {

    fileprivate func getData(_ url: String, isLoadMore: Bool) {

//        SVProgressHUD.show()

        LKNetworkManager.shareInstance.request(url, method: .get) { (responseString, error) in

            if !isLoadMore {
                self.dataSource.removeAll()
            }

            if let jsonString = responseString {

                LKLog(jsonString)

                if let responseModel = ResponseModel(JSONString: jsonString) {

                    if (responseModel.list != nil){

                        for model in responseModel.list! {

                            self.dataSource.append(model)
                        }
                    }
                }
            }

            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()

            self.tableView.reloadData()
        }
    }
}
// MARK: - Tableview dataSource delegate
extension LKBaseTopicViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Identifier")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "Identifier")
        }

        return cell!
    }

}

// MARK: - public method
extension LKBaseTopicViewController {


}
