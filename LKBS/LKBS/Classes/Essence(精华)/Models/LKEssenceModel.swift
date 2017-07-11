//
//  LKEssenceModel.swift
//  LKBS
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit
import ObjectMapper

struct ResponseModel: Mappable {

    var info_count: Int?
    var info_np: Int?

    var list: [ListModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        info_count <- map["info.count"]
        info_np    <- map["info.np"]
        list       <- map["list"]
    }
}

struct ListModel: Mappable {

    var status: Int?
    var comment: Int?
//    var tags: [TagsModel]?
    var bookmark: Int?
    var text: String?
    var up: Int?
    var shareUrl: String?
    var down: Int?
    var forward: Int?

    var u: UserModel?
    var passtime: String?

    var type: String? // audio image video gif text
    var id: Int?

    var top_comments: [CommentModel]?


    /// 视频相关的
    var video_playfcount: Int?
    var video_width: Int?
    var video_height: Int?
    var video_uri:String?
    var video_duration: Int?
    var video_playcount: Int?
    var video_thumbnail: String?
    var video_thumbnail_small: String?

    /// 图片相关的
    var image_medium: String?
    var image_big: String?
    var image_height: Int?
    var image_width: Int?
    var image_small: String?
    var image_thumbnail_small: String?

    /// gif
    var images_gif: String?
    var gif_width: Int?
    var gif_thumbnail: String?
    var gif_height: Int?

    /// 音频
    var audio_playfcount: Int?
    var audio_height: Int?
    var audio_width: Int?
    var audio_duration: Int?
    var audio_playcount: Int?
    var audio_uri: String?
    var audio_thumbnail: String?
    var audio_thumbnail_small: String?


    init?(map: Map) {

    }
    mutating func mapping(map: Map) {

        status       <- map["status"]
        comment      <- map["comment"]
//        tags     <- map["tags"]
        bookmark     <- map["bookmark"]
        text         <- map["text"]
        up           <- map["up"]
        shareUrl     <- map["share_url"]
        down         <- map["down"]
        forward      <- map["forward"]
        u          <- map["u"]
        passtime     <- map["passtime"]
        type         <- map["type"]
        id           <- map["id"]
        top_comments <- map["top_comments"]


        video_playcount       <- map["video.playfcount"]
        video_width           <- map["video.width"]
        video_height          <- map["video.height"]
        video_uri             <- map["video.video.0"]
        video_duration        <- map["video.duration"]
        video_playfcount      <- map["video.playcount"]
        video_thumbnail       <- map["video.thumbnail.0"]
        video_thumbnail_small <- map["video.thumbnail_small.0"]


        image_medium           <- map["image.medium.0"]
        image_big              <- map["image.big.0"]
        image_height           <- map["image.height"]
        image_width            <- map["image.width"]
        image_small            <- map["image.small.0"]
        image_thumbnail_small  <- map["image.thumbnail_small.0"]


        images_gif             <- map["gif.images.0"]
        gif_width              <- map["gif.width"]
        gif_thumbnail          <- map["gif.gif_thumbnail.0"]
        gif_height             <- map["gif.height"]


        audio_playfcount       <- map["audio.playfcount"]
        audio_height           <- map["audio.height"]
        audio_width            <- map["audio.width"]
        audio_duration         <- map["audio.duration"]
        audio_playcount        <- map["audio.playcount"]
        audio_uri              <- map["audio.audio.0"]
        audio_thumbnail        <- map["audio.thumbnail.0"]
        audio_thumbnail_small  <- map["audio.thumbnail_small.0"]
    }
}

//struct TagsModel: Mappable {
//
//    var info: String?
//    var post_number: Int?
//    var image_list: String?
//    var colum_set: Int?
//    var sub_number: Int?
//    var display_level: Int?
//    var id: Int?
//
//    init?(map: Map) {
//
//    }
//
//    mutating func mapping(map: Map) {
//
//    }
//}

struct UserModel: Mappable {

    var id: Int?
    var name: String?
    var username: String?
    var header: String?
    var uid: Int?
    var profile_image: String?
    var sex: String?
    var is_vip: Bool?
    var is_v: Bool?
    var total_cmt_like_count: Int?
    var room_url: String?
    var room_name: String?
    var room_role: String?
    var room_icon: String?
    var qq_uid: String?
    var weibo_uid: String?
    var personal_page: String?
    var qzone_uid: String?


    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id                    <- map["id"]
        name                  <- map["name"]
        username              <- map["username"]
        header                <- map["header.0"]
        uid                   <- map["uid"]
        profile_image         <- map["profile_image"]
        sex                   <- map["sex"]
        is_vip                <- map["is_vip"]
        is_v                  <- map["is_v"]
        total_cmt_like_count  <- map["total_cmt_like_count"]
        room_url              <- map["room_url"]
        room_name             <- map["room_name"]
        room_role             <- map["room_role"]
        room_icon             <- map["room_icon"]
        qq_uid                <- map["qq_uid"]
        weibo_uid             <- map["weibo_uid"]
        personal_page         <- map["personal_page"]
        qzone_uid             <- map["qzone_uid"]
    }

}

class CommentModel: Mappable {

    var id: Int?
    var data_id: Int?
    var u: UserModel?
    var user: UserModel?
    var content: String?
    var like_count: Int?
    var hate_count: Int?
    var floor: Int?
    var passtime: String?
    var ctime: String?

    var voicetime: String?
    var voiceuri: String?

    var video_width: Int?
    var video_height: Int?
    var videotime: Int?
    var videouri: String?
    var avmixed: Bool?
    var video_thumbnail: String?

    var cmt_type: String?
    var type: String?
    var precid: Int?
    var preuid: Int?
    var status: Int?

    var image: String?
    var image_width: Int?
    var image_height: Int?

    var precmt: CommentModel?


    required init?(map: Map) {

    }

    func mapping(map: Map) {

        id           <- map["id"]
        data_id      <- map["data_id"]
        u            <- map["u"]
        user         <- map["user"]
        content      <- map["content"]
        like_count   <- map["like_count"]
        hate_count   <- map["hate_count"]
        floor        <- map["floor"]
        passtime     <- map["passtime"]
        ctime        <- map["ctime"]
        avmixed      <- map["avmixed"]
        cmt_type     <- map["cmt_type"]
        type         <- map["type"]
        precid       <- map["precid"]
        preuid       <- map["preuid"]
        status       <- map["status"]


        voiceuri         <- map["audio.audio.0"]
        voicetime        <- map["audio.duration"]
        precmt           <- map["precmts.0"]
        image            <- map["image.images.0"]
        image_width      <- map["image.width"]
        image_height     <- map["image.height"]
        video_width      <- map["video.width"]
        video_height     <- map["video.height"]
        videotime        <- map["video.duration"]
        videouri         <- map["video.video.0"]
        video_thumbnail  <- map["video.thumbnail.0"]
    }
}
