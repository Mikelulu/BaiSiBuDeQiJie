//
//  LKDetailViewController.swift
//  LKBS
//
//  Created by admin on 2017/7/22.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import BMPlayer

class LKDetailViewController: LKBaseViewController {

    open var model: ListModel? {
        
        didSet {
            
            let url = BMPlayerResource.init(url: URL.init(string: model!.video_uri!)!)
            player.setVideo(resource: url)
        }
    }
    
    private let player: BMPlayer = BMPlayer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(player)
        player.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(kStatusBarHeight)
            make.left.right.equalTo(self.view)
            make.height.equalTo(player.snp.width).multipliedBy(9.0/16.0).priority(750)
        }
        // Back button event
        player.backBlock = { [unowned self] (isFullScreen) in
            if isFullScreen == true { return }
            let _ = self.navigationController?.popViewController(animated: true)
        }
    }

    deinit {
        
        LKLog("播放器释放了")
    }
    

   

}
