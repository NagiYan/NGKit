//
//  NGToastView.swift
//  NGKit
//
//  Created by nagi on 16/8/11.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

class NGToastView : UILabel
{
    private static var delayCount = 0.0;
    
    /**
     在父视图上显示
     
     - parameter view:   父视图
     - parameter text:   显示信息
     - parameter second: 延时时间
     - parameter pos:    显示位置 距底部的距离
     */
    static func show(parent view:UIView, text:String, delay second:Double = 0.0, bottom pos:Float = 150)
    {
        let toast = NGToastView(text: text, delay: second)
        view.addSubview(toast)
        
        toast.layer.borderColor = UIColor.grayColor().CGColor
        toast.backgroundColor = UIColor.blackColor()
        toast.textColor = UIColor.whiteColor()
        toast.font = UIFont.systemFontOfSize(18)
        toast.textAlignment = .Center
        toast.ng_shapeCornerAll(10)
        toast.userInteractionEnabled = false;
        toast.numberOfLines = 0;
        
        let contentHeight = UIFont.systemFontOfSize(18).ng_height(for: text, max: view.frame.width - 80)
        
        toast.frame = CGRectMake(30
            , view.frame.height - CGFloat(contentHeight - 40.0 - pos)
            , view.frame.width - 60
            , CGFloat(contentHeight + 40.0));
        
        if view.isKindOfClass(UIScrollView.self)
        {
            toast.frame.origin.x = toast.frame.origin.x + (view as! UIScrollView).contentOffset.x
            toast.frame.origin.y = toast.frame.origin.y + (view as! UIScrollView).contentOffset.y
        }
    }

    /**
     便利构造函数
     
     - parameter text:   信息
     - parameter second: 延时 秒
    
     */
    convenience init(text:String, delay second:Double)
    {
        let delay = second + NGToastView.delayCount * 2.0
        NGToastView.delayCount += 1
        self.init()
        
        self.text = text
        self.alpha = 0.0
        performSelector(#selector(NGToastView.p_displayToast(_:)), withObject: nil, afterDelay: delay)
        
    }

    
    //MARK: 私有函数
    
    /**
     显示
     
     - parameter object: 参数
     */
    @objc private func p_displayToast(object:AnyObject)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        alpha = 0.8
        UIView.commitAnimations()
        
        performSelector(#selector(NGToastView.p_dismissToast(_:)), withObject: nil, afterDelay: 1.5)
    }
    
    /**
     移除动画
     
     - parameter object: 参数
     */
    @objc private func p_dismissToast(object:AnyObject)
    {
        NGToastView.delayCount -= 1
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(NGToastView.p_didDismiss(_:)))
        alpha = 0.0
        UIView.commitAnimations()
    }
    
    /**
     移除
     
     - parameter object: 参数
     */
    @objc private func p_didDismiss(object:AnyObject)
    {
        removeFromSuperview()
    }
    

}