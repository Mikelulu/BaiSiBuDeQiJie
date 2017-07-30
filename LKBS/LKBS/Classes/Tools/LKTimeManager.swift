//
//  LKTimeManager.swift
//  LKBS
//
//  Created by mac on 2017/7/29.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

struct LKTimeManager {

    
    /// 传入时间戳 返回发表的时间（..小时前，...天前）
    ///
    /// - Parameter timeString: 要计算的时间字符串
    /// - Returns: <#return value description#>
    public static func getPublishTimeString(_ timeString: String?) -> String {
        
        guard (timeString != nil) else {
            return ""
        }
        /// 现将时间转成date格式
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale.init(identifier: "zh_CN")
        dateFormatter.timeZone = TimeZone.current
        let date: Date = dateFormatter.date(from: timeString!)!
        
        /// 得到的时间戳是负数 因为是现在之前的时间
        var timeInterval: TimeInterval = date.timeIntervalSinceNow
        timeInterval = -timeInterval
        
        var resultString = ""
        
        if timeInterval < 60 {
            resultString = "刚刚"
        }else if (timeInterval / 60) < 60 {
            
            let string: String = String.init(format: "%d", Int(timeInterval / 60))
            resultString = "\(string)分钟前"
            
        }else if (timeInterval / 60 / 60) < 24 {
            let string: String = String.init(format: "%d", Int(timeInterval / 60 / 60))
            resultString = "\(string)小时前"
            
        }else if (timeInterval / 60 / 60 / 24) < 30 {
            let string: String = String.init(format: "%d", Int(timeInterval / 60 / 60 / 24))
            resultString = "\(string)天前"
            
        }else if (timeInterval / 60 / 60 / 24 / 30) < 12 {
            let string: String = String.init(format: "%df", Int(timeInterval / 60 / 60 / 24 / 30))
            resultString = "\(string)月前"
            
        }else {
            let string: String = String.init(format: "%d", Int(timeInterval / 60 / 60 / 24 / 30 / 12))
            resultString = "\(string)年前"
        }
        
        return resultString
        
    }
    
}
