//
//  Frame+Extension.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit


extension UIView {

    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {

            self.frame.origin.x = newValue

        }
    }

    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {

            self.frame.origin.y = newValue

        }
    }

    /// 右边界的x值
    public var rightX: CGFloat{
        get{
            return self.x + self.width
        }
        set{

            self.frame.origin.x = newValue - frame.size.width

        }
    }
    /// 下边界的y值
    public var bottomY: CGFloat{
        get{
            return self.y + self.height
        }
        set{

            self.frame.origin.y = newValue - frame.size.height

        }
    }

    public var centerX : CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }

    public var centerY : CGFloat{
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }

    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{

            self.frame.size.width = newValue

        }
    }
    public var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{

            self.frame.size.height = newValue

        }
    }


    public var origin: CGPoint{
        get{
            return self.frame.origin
        }
        set{
            self.x = newValue.x
            self.y = newValue.y
        }
    }

    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            self.width = newValue.width
            self.height = newValue.height
        }
    }
}
