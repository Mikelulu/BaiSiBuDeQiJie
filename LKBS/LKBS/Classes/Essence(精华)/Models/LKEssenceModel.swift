//
//  LKEssenceModel.swift
//  LKBS
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import HandyJSON

struct ResponseModel: HandyJSON {

    var info: InfoModel?

    var list: [ListModel]?


}
struct InfoModel: HandyJSON {

    var count: Int?
    var np: Int?
}

struct ListModel: HandyJSON {

    var status: Int?
    var comment: Int?
    var tags: [TagsModel]?
    var bookmark: Int?
    var text: String?
    var up: Int?
    var share_url: String?
    var down: Int?
    var forward: Int?

    var u: UModel?
    var passtime: String?
    var video: VideoModel?

    var type: String? // audio image video gif text
    var id: Int?

}

struct TagsModel: HandyJSON {

    var info: String?
    var post_number: Int?
    var image_list: String?
    var colum_set: Int?
    var sub_number: Int?
    var display_level: Int?
    var id: Int?
}

struct UModel: HandyJSON {

    var header: [String]?
    var uid: Int?
    var is_vip: Bool?
    var is_v: Bool?
    var room_url: String?
    var room_name: String?
    var room_role: String?
    var room_icon: String?
    var name: String?
}

struct VideoModel: HandyJSON {

    var playfcount: Int?
    var height: CGFloat?
    var width: CGFloat?
    var video: [String]?
    var download: [String]?
    var duration: CGFloat?
    var playcount: Int?
    var thumbnail: [String]?
    var thumbnail_small: [String]?

}
