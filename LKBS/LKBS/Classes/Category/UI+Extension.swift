//
//  UI+Extension.swift
//  LKBS
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 LK. All rights reserved.
//

import UIKit

// MARK: - UIColor的分类
extension UIColor {

    class func hexInt(_ hexValue: Int) -> UIColor {

        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,

                       green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,

                       blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,

                       alpha: 1.0)
    }

    class func randomColor() -> UIColor{
        return UIColor(red: CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1.0)
    }

    class func random() -> UIColor{
        return UIColor.randomColor()
    }

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }

    convenience init(c: CGFloat,  alpha: CGFloat = 1.0) {
        self.init(red: c/255.0, green: c/255.0, blue: c/255.0, alpha: alpha)
    }

    convenience init?(hex:String) {
        guard hex.characters.count>=6 else {
            return nil
        }

        var hexTemp = hex.uppercased()
        if hexTemp.hasPrefix("0X") || hexTemp.hasPrefix("##"){
            hexTemp = (hexTemp as NSString).substring(from: 2)
        }

        if hexTemp.hasPrefix("#"){
            hexTemp = (hexTemp as NSString).substring(from: 1)
        }

        var range = NSRange(location: 0, length: 2)
        let rHex = (hexTemp as NSString).substring(with: range)
        range.location = 2
        let gHex = (hexTemp as NSString).substring(with: range)
        range.location = 4
        let bHex = (hexTemp as NSString).substring(with: range)

        var r : UInt32 = 0
        var g : UInt32 = 0
        var b : UInt32 = 0

        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)

        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }

    func getRGB() -> (CGFloat,CGFloat,CGFloat) {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0

        if self.getRed(&r, green: &g, blue: &b, alpha: nil){
            return (r * 255,g * 255,b * 255)
        }

        guard let cmps = cgColor.components else {
            //            throw
            fatalError("请使用RGB创建UIColor")
        }
        return(cmps[0] * 255,cmps[1] * 255,cmps[2] * 255)
    }

}

// MARK: - String的分类（结构体类型）
extension String {

    // MARK: - 获取字符串的宽度
    public static func getStringWidth(string: String, fontSize: CGFloat) -> CGFloat {

        let rect = string.boundingRect(with: CGSize.init(width: Double(MAXFLOAT), height: 10), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return CGFloat(ceilf(Float(rect.width)))
    }

    // MARK: - 获取字符串的高度
    public static func getStringHeight(string: String, fontSize: CGFloat, width: CGFloat) -> CGFloat {

        let rect = string.boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return CGFloat(ceil(Float(rect.height)))
    }

    /// 返回当前时间的时间戳
    static func getCurrentTimeSemp() -> String {

        let date: Date = Date.init(timeIntervalSinceNow: 0)
        let timeSemp: TimeInterval = date.timeIntervalSince1970

        return String.init(format: "%.0f", timeSemp)
    }
}


/// 图片在上 文字在下
class LKTopButton: UIButton {

    ///
    let fonsize: CGFloat = 13
    let titleColor: UIColor = UIColor.gray
    let margin: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: fonsize)
        self.setTitleColor(titleColor, for: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        /// 修改图片位置
        imageView?.width = self.width * 0.7
        imageView?.height = (imageView?.width)!
        imageView?.x = (self.width - (imageView?.width)!) / 2
        imageView?.y = 0

        /// 修好标题的位置
        titleLabel?.width = self.width
        titleLabel?.height = self.height - (imageView?.height)!
        titleLabel?.x = 0
        titleLabel?.y = (imageView?.height)! + margin

//        imageView?.layer.cornerRadius = (imageView?.width)! / 2
//        imageView?.layer.masksToBounds = true
//        imageView?.backgroundColor = UIColor.red
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
/// 图片在you 文字在zuo
class LKRightButton: UIButton {

    let fonsize: CGFloat = 13
    let titleColor: UIColor = UIColor.gray
    let margin: CGFloat = 0


    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel?.textAlignment = .right
        titleLabel?.font = UIFont.systemFont(ofSize: fonsize)
        self.setTitleColor(titleColor, for: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.titleLabel?.x = 0;
        self.titleLabel?.width = self.width * 0.7;
        self.titleLabel?.y = 0;
        self.titleLabel?.height = self.height;

        self.imageView?.x = (self.titleLabel?.width)! + margin;
        self.imageView?.y = 0;
        self.imageView?.width = self.width - (self.imageView?.x)!;
        self.imageView?.height = self.height;

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UIBarButtonItem的分类
extension UIBarButtonItem {


    /// 快速设置barbuttonItem （图片）
    ///
    /// - Parameters:
    ///   - icon: 正常状态图片名字
    ///   - heightIcon: 高亮状态图片名字
    ///   - target: <#target description#>
    ///   - action: <#action description#>
    /// - Returns: barbuttonItem
    public class func item(icon: String,heightIcon: String?,target: Any,action: Selector?) -> UIBarButtonItem {

        let btn: UIButton = UIButton()
        btn.setBackgroundImage(UIImage.init(named: icon), for: .normal)

        if (heightIcon != nil) {
            btn.setBackgroundImage(UIImage.init(named: heightIcon!), for: .highlighted)
        }

        btn.frame = CGRect(x: 0, y: 0, width: (btn.currentBackgroundImage?.size.width)!, height: (btn.currentBackgroundImage?.size.height)!)

        if (action != nil) {

            btn.addTarget(target, action: action!, for: .touchUpInside)
        }

        return UIBarButtonItem(customView: btn)
    }

    public class func backItem(icon: String,heightIcon: String?,target: Any,action: Selector?, title: String) -> UIBarButtonItem {

        let btn: UIButton = UIButton()
        btn.setImage(UIImage.init(named: icon), for: .normal)
        if (heightIcon != nil) {
            btn.setImage(UIImage.init(named: heightIcon!), for: .highlighted)
        }

        btn.setTitle(title, for: .normal)
        btn.setTitleColor(RGB(249, 173, 184), for: .normal)
        btn.setTitleColor(RGB(249, 173, 184), for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)

        btn.sizeToFit()

        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)

        if (action != nil) {

            btn.addTarget(target, action: action!, for: .touchUpInside)
        }

        return UIBarButtonItem(customView: btn)
    }
}

// MARK: - 裁剪 view 的圆角
extension UIView {

    /// 裁剪 view 的圆角
    ///
    /// - parameter direction:    裁剪哪一个角
    /// - parameter cornerRadius: 圆角值
    func clipRectCorner(direction: UIRectCorner,cornerRadius: CGFloat) {
        let cornerSize = CGSize.init(width: cornerRadius, height: cornerRadius)
        //贝塞尔
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskShapLayer = CAShapeLayer.init()
        maskShapLayer.frame = bounds
        maskShapLayer.path = maskPath.cgPath
        layer.addSublayer(maskShapLayer)
        layer.mask = maskShapLayer
    }
}
// MARK: - UIImage的分类
extension UIImage {


    public func imageWithTintColor(_ color: UIColor) -> UIImage {

        return changeImage(color, blendMode: .destinationIn)
    }

    public func imageWithGradientTintColor(_ color: UIColor) -> UIImage {

        return changeImage(color, blendMode: .overlay)
    }

    private func changeImage(_ tintColor: UIColor, blendMode: CGBlendMode) -> UIImage {

        /// 参数一： 绘制的大小
        /// 参数二： 不透明 （true 为 不透明  false 为透明）
        /// 参数三： 0
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)

        /// 颜色填充
        tintColor.setFill()

        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)

        UIRectFill(bounds)


        self.draw(in: bounds, blendMode: blendMode, alpha: 1.0)

        if blendMode != .destinationIn {
            self.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        }

        let image = UIGraphicsGetImageFromCurrentImageContext()

        return image!

    }
    /// 通过颜色生成图片
    ///
    /// - Parameter color: 要生成的图片颜色
    /// - Returns:
    public class func createImageWithColor(_ color: UIColor, _ size: CGSize) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        color.set()

        UIRectFill(CGRect.init(x: 0, y: 0, width: size.width, height: size.height))

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image!
    }

    /// 等比压缩图片
    ///
    /// - Parameter width: 显示的图片的宽度
    /// - Returns: 返回压缩后的图片
    public func compressImage(_ width: CGFloat) -> UIImage {

        /// 压缩后的高度
        let height: CGFloat = width / self.size.width * self.size.height

        let size = CGSize(width: width, height: height)

        /// 开启图形上下文
        UIGraphicsBeginImageContext(size)

        /// 图片绘制到指定区域内
        self.draw(in: CGRect.init(x: 0, y: 0, width: width, height: height))

        /// 通过图形上下文获取压缩后的图片
        let imag: UIImage? = UIGraphicsGetImageFromCurrentImageContext()

        /// 关闭图形上下文
        UIGraphicsEndImageContext()

        return imag!
    }

    /// 拉伸图片
    ///
    /// - Parameter imageName: 要拉伸的图片名字
    /// - Returns: 返回拉伸后的图片
    public class func strechImage(imageName: String) -> UIImage {
        
        let image = UIImage.init(named: imageName)
        
        return (image?.stretchableImage(withLeftCapWidth: Int((image?.size.width)! * 0.5), topCapHeight: Int((image?.size.height)! * 0.5)))!
    }

    /// 截图功能，根据尺寸截取view成为一张图片
    ///
    /// - Parameters:
    ///   - view: 需要截取的View
    ///   - rect: 需要截取的区域
    /// - Returns: 新生成的已截取的图片
    public class func imageWithSnapshot(view: UIView, rect: CGRect) -> UIImage{

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        /// 把控件上的图层渲染到上下文,layer只能渲染   (wkwebView 需要使用 view.drawHierarchy(in: rect, afterScreenUpdates: true))
        view.layer.render(in: UIGraphicsGetCurrentContext()!)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image!
    }
}
