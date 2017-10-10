//
//  Comment.swift
//  LKBS
//
//  Created by admin on 2017/6/20.
//  Copyright © 2017年 LK. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit
import Kingfisher
import HandyJSON
import ObjectMapper

import MJRefresh
import SVProgressHUD
import pop
import UITableView_FDTemplateLayoutCell

// 当前系统版本
let kCersion = (UIDevice.current.systemVersion as NSString).floatValue
// 屏幕宽度
let kScreenH = UIScreen.main.bounds.height
// 屏幕高度
let kScreenW = UIScreen.main.bounds.width

/// 判断设备
let kIsIpad = UIDevice.current.userInterfaceIdiom == .pad

let kIsIphon = UIDevice.current.userInterfaceIdiom == .phone

let kIphone4 = kIsIphon && kScreenH < 568

let kIphone5 = kIsIphon && kScreenH == 568

let kIphone6 = kIsIphon && kScreenH == 667

let kIphoneP = kIsIphon && (kScreenH == 736 || kScreenW == 736)

let kIphoneX = kIsIphon && (kScreenH == 812 && kScreenW == 375)

/// 状态栏高度
let kStatusBarHeight: CGFloat = kIphoneX ? 44 : 20

/// 导航高度 + 状态栏的高度
let kNavigationHeight: CGFloat = 44 + kStatusBarHeight

/// 底部距安全区域的间距
let kTabbarSafeBottomMargin: CGFloat = kIphoneX ? 34 : 0

/// tabbar的高度
let kTabbarHeight: CGFloat = 49 + kTabbarSafeBottomMargin

/// 顶部距安全区域的间距 （去掉状态栏的高度） 44
let kSafeTopMargin: CGFloat = kIphoneX ? 24 : 0



//以6/6s为准
//按比例获取高度
func ZDHeight (_ height: CGFloat) -> CGFloat {
    
    return height * kScreenH / 677.0
}
//按比例获取宽度
func ZDWidth (_ width: CGFloat) -> CGFloat {
    
    return width * kScreenW / 375.0
}


//Window
let kWindow = UIApplication.shared.keyWindow


let kUserDefaults = UserDefaults.standard


/// hud消失时间
let kHud_dismiss = 2.0


// MARK:- 颜色方法
func RGBA (_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGB (_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}


//主题颜色 字体 等
/// 界面背景颜色
let kBgColor = UIColor.hexInt(0xf5f5f5)

let kSelectColor = RGBA(252, 49, 89, 0.9)

let kNormalColor = UIColor.hexInt(0x666666)

let kBlackColor = UIColor.hexInt(0x333333)

let kSubTitleColor = UIColor.hexInt(0x999999)


let kLineColor = UIColor.hexInt(0xe9e9e9)
/// 导航栏颜色
let kNavTinColor = RGB(252, 49, 89).withAlphaComponent(0.9)

let kMargin: CGFloat = 10

let kRecommendItemWith: CGFloat = (kScreenW - 3 * kMargin) / 2

let kRecommendItemHeight: CGFloat = 110


// MARK:- 自定义打印方法
func LKLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName)(\(lineNum)): \(message)")
        
    #endif
}

