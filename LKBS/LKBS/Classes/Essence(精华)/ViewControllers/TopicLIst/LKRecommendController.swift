//
//  LKRecommendController.swift
//  LKBS
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

class LKRecommendController: LKBaseTopicViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)


    }

}
extension LKRecommendController: ZJScrollPageViewChildVcDelegate {


    func zj_viewDidLoad(for index: Int) {

        if index == 0 {

            self.urlString = "http://s.budejie.com/topic/list/jingxuan/1/bs0315-iphone-4.5.6/%i-20.json"
            self.isShowBanner = true
        }
    }

    func zj_viewWillAppear(for index: Int) {

    }

    func zj_viewDidAppear(for index: Int) {

    }

    func zj_viewWillDisappear(for index: Int) {

    }

    func zj_viewDidDisappear(for index: Int) {

    }
}
