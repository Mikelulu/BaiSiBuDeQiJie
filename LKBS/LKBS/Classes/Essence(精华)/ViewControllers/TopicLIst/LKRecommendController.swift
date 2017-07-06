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

        self.urlString = "http://s.budejie.com/topic/list/jingxuan/1/bs0315-iphone-4.5.6/%i-20.json"
        self.isShowBanner = true
    }

}
