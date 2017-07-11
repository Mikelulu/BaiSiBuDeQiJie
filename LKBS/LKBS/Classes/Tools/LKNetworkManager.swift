//
//  LKNetworkManager.swift
//  LKBS
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD


class LKNetworkManager: NSObject {

    /// 单利
    static let shareInstance: LKNetworkManager = LKNetworkManager()


    public func request(_ urlString: String, method: HTTPMethod, parameters: [String : Any]? = nil, finished: @escaping ((String?, Error?) -> ())) {

        Alamofire.request(urlString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { (dataResponse) in

            SVProgressHUD.dismiss()

            if dataResponse.result.isSuccess {

                if let jsonString = dataResponse.result.value {

                    finished(jsonString, nil)
                }

            }else {

                finished(nil, dataResponse.result.error)

                LKLog(dataResponse.result.error)

                if (dataResponse.result.error! as NSError).code == -1001 {

                    SVProgressHUD.showError(withStatus: "请求超时")
                }else {

                    SVProgressHUD.showError(withStatus: "请求失败")
                }
            }
        }
    }

}
