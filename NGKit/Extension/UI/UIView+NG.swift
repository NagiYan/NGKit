//
//  UIView+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/9.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    //MARK: 形状相关
    
    private static let ngHoldTag = 65535
    
    /**
     圆角函数，能指定特定几个角
     
     - parameter corners: 需要设置的角
     - parameter radius:  圆角半径
     */
    func ng_shapeCorner(with corners:UIRectCorner, radius:CGFloat)
    {
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSizeMake(radius, radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.CGPath
        self.layer.mask = maskLayer
    }
    
    /**
     设置全部角为圆角
     
     - parameter radius: 圆角半径
     */
    func ng_shapeCornerAll(radius:CGFloat)
    {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true;
    }
    

    /**
     使用图片的方式设置圆角
     
     - parameter image: 遮罩图片
     - parameter color: 背景颜色
     */
    func ng_shapeCornerAll(with image:UIImage, background color:UIColor = UIColor.whiteColor())
    {
        var shiled = self.viewWithTag(UIView.ngHoldTag) as? UIImageView
        if shiled == nil
        {
            shiled = UIImageView()
            shiled!.tag = UIView.ngHoldTag
            self.addSubview(shiled!)
        }
        shiled!.frame = self.bounds
        shiled!.tintColor = color
        shiled!.image = image.imageWithRenderingMode(.AlwaysTemplate)
        
    }

    
    /**
     插入水平虚线
     
     - parameter color: 虚线颜色
     */
    func ng_shapeDashLineHorizontal(color:UIColor)
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = bounds
        shapeLayer.position = center
        shapeLayer.fillColor = color.CGColor
        shapeLayer.fillRule = kCAFillRuleEvenOdd
        
        shapeLayer.strokeColor = color.CGColor
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        
        // 设置虚线的宽度
        shapeLayer.lineWidth = bounds.width
        
        // 线的宽度 每条线的间距
        shapeLayer.lineDashPhase = 0.5
        shapeLayer.lineDashPattern = [0.1, 2*bounds.width]
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, bounds.height/2)
        CGPathAddLineToPoint(path, nil, bounds.width, bounds.height/2)
        
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
   
    /**
     颜色渐变
     */
    func ng_shapeTransparentGradientTopBottom(colorArray:Array<UIColor> = [RGBA(33, g: 33, b: 33, a: 0), RGBA(1, g: 1, b: 1, a: 1)]
                                             , locations:Array<CGFloat> = [0.0, 1.0])
    {
        let headerLayer = CAGradientLayer()
        headerLayer.colors = colorArray
        headerLayer.locations = locations
        headerLayer.frame = bounds
        layer.insertSublayer(headerLayer, atIndex: 0)
    }
    
    /**
     颜色渐变
     */
    func ng_shapeTransparentGradientLeftRight(colorArray:Array<UIColor> = [RGBA(33, g: 33, b: 33, a: 0), RGBA(1, g: 1, b: 1, a: 1)]
                                             , locations:Array<CGFloat> = [0.0, 1.0])
    {
        let headerLayer = CAGradientLayer()
        headerLayer.colors = colorArray
        // 颜色分布比例，数量与颜色数相同
        headerLayer.locations = locations
        headerLayer.startPoint = CGPointMake(0, 0.5)
        headerLayer.endPoint = CGPointMake(1, 0.5)
        headerLayer.frame = bounds
        layer.insertSublayer(headerLayer, atIndex: 0)
    }
    
    //MARK: 子视图相关
    /**
     释放全部子视图
     */
    func ng_freeSubViews()
    {
        while subviews.count > 0
        {
            subviews[0].removeFromSuperview()
        }
        self.dynamicType
    }
    
    /**
     释放全部子视图
     
     - parameter except: 例外的类型
     */
    func ng_freeSubViews(except:String)
    {
        for view in subviews
        {
            if except == NSStringFromClass(view.dynamicType)
            {
                continue
            }
        }
    }
    
    /**
     释放指定子视图
     
     - parameter tag: tag
     */
    func ng_freeSubViews(by tag:Int)
    {
        while let subView = ng_getFirstSubView(by: tag)
        {
            subView.removeFromSuperview()
        }
    }
    
    /**
     释放特定类型的子视图
     
     - parameter tag:  标签
     - parameter type: 类型
     */
    func ng_freeSubViews(by tag:Int, and type:String)
    {
        while let subView = ng_getFirstSubView(by: tag, and: type)
        {
            subView.removeFromSuperview()
        }
    }
    
    /**
     获取特定标签和类型的子视图
     
     - parameter tag:  特定标签
     - parameter type: 特定类型
     
     - returns: 结果
     */
    func ng_getFirstSubView(by tag:Int, and type:String) -> UIView?
    {
        for view in subviews
        {
            if view.tag == tag && NSStringFromClass(view.dynamicType) == type
            {
                return view
            }
        }
        return nil
    }
    
    /**
     查找特定子视图，系统自带的viewWithTag会返回自身
     
     - parameter tag:       特定标签
     - parameter recurison: 是否递归查找子视图的子视图
     
     - returns: 结果
     */
    func ng_getFirstSubView(by tag:Int, recurison:Bool = false) -> UIView?
    {
        for view in subviews
        {
            if view.tag == tag
            {
                return view
            }
            else if recurison
            {
                let found = view.ng_getFirstSubView(by: tag, recurison: true)
                if found != nil
                {
                    return found
                }
            }
        }
        return nil
    }
    
    //MARK: 图形相关
    
    /**
     将当前视图转化为图形
     
     - returns: 结果
     */
    func ng_toImage() -> UIImage
    {
        UIGraphicsBeginImageContext(bounds.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        UIRectClip(bounds)
        layer.renderInContext(context!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    //MARK: 其它
    
    /**
     获取当前UIView所属的UIViewController
     
     - returns: UIViewController
     */
    func ng_parentViewController() -> UIViewController?
    {
        var target:UIResponder? = self as UIResponder
        while target != nil
        {
            if target.dynamicType == UIViewController.self
            {
                break
            }
            target = target?.nextResponder()
        }
        return target as? UIViewController
    }
}