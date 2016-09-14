//
//  NGToastView.swift
//  NGKit
//
//  Created by nagi on 16/8/11.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

open class NGToastView : UILabel
{
    fileprivate static var delayCount = 0.0;
    
    /**
     在父视图上显示
     
     - parameter view:   父视图
     - parameter text:   显示信息
     - parameter second: 延时时间
     - parameter pos:    显示位置 距底部的距离
     */
    open static func show(parent view:UIView, text:String, delay second:Double = 0.0, bottom pos:Float = 150)
    {
        let toast = NGToastView(text: text, delay: second)
        view.addSubview(toast)
        
        toast.layer.borderColor = UIColor.gray.cgColor
        toast.backgroundColor = UIColor.black
        toast.textColor = UIColor.white
        toast.font = UIFont.systemFont(ofSize: 18)
        toast.textAlignment = .center
        toast.ng_shapeCornerAll(10)
        toast.isUserInteractionEnabled = false;
        toast.numberOfLines = 0;
        
        let contentHeight = UIFont.systemFont(ofSize: 18).ng_height(for: text as NSString, max: view.frame.width - 80)
        
        toast.frame =  CGRect(x: 30,
                              y: view.frame.height - CGFloat(contentHeight - 40.0 - pos),
                              width: view.frame.width - 60,
                              height: CGFloat(contentHeight + 40.0))
        
        if view is UIScrollView
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
    public convenience init(text:String, delay second:Double)
    {
        let delay = second + NGToastView.delayCount * 2.0
        NGToastView.delayCount += 1
        self.init()
        
        self.text = text
        self.alpha = 0.0
        perform(#selector(NGToastView.p_displayToast(_:)), with: nil, afterDelay: delay)
        
    }

    
    //MARK: 私有函数
    
    /**
     显示
     
     - parameter object: 参数
     */
    @objc fileprivate func p_displayToast(_ object:AnyObject)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        alpha = 0.8
        UIView.commitAnimations()
        
        perform(#selector(NGToastView.p_dismissToast(_:)), with: nil, afterDelay: 1.5)
    }
    
    /**
     移除动画
     
     - parameter object: 参数
     */
    @objc fileprivate func p_dismissToast(_ object:AnyObject)
    {
        NGToastView.delayCount -= 1
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(NGToastView.p_didDismiss(_:)))
        alpha = 0.0
        UIView.commitAnimations()
    }
    
    /**
     移除
     
     - parameter object: 参数
     */
    @objc fileprivate func p_didDismiss(_ object:AnyObject)
    {
        removeFromSuperview()
    }
    

}
