//
//  NGNaviBar.swift
//  NGKit
//
//  Created by nagi on 16/8/30.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import UIKit

open class NGNaviBar: UIView {

    // 标题栏
    open var labelTitle:UILabel!
    // 左侧按钮
    open var buttonLeft:UIButton!
    // 右侧按钮
    open var buttonRight:UIButton!
    // 右侧按钮2
    open var buttonRight2nd:UIButton!
    
    /// 左侧返回按钮图标
    open static var leftButtonImage:UIImage?;
    
    // MARK: 外部接口
    
    /**
     以默认位置尺寸创建 顶部 （0, 0, width, 64）
     */
    public init()
    {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.ng_width(), height: 64)
        super.init(frame: rect)
        p_init(with: rect)
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        p_init(with: frame)
    }
    
    /**
     将按钮变成带灰底的圆形按钮
     */
    open func makeButtonRound()
    {
        if !buttonLeft.isHidden
        {
            let bkgLeft = UIView(frame: CGRect(x: 11, y: 26, width: 32, height: 32))
            addSubview(bkgLeft)
            bkgLeft.ng_shapeCornerAll(16)
            bkgLeft.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubview(toFront: buttonLeft)
        }
        
        if !buttonRight.isHidden
        {
            bkgRight = UIView(frame: CGRect(x: frame.width - 11 - 32, y: 26, width: 32, height: 32))
            addSubview(bkgRight)
            bkgRight.ng_shapeCornerAll(16)
            bkgRight.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubview(toFront: buttonRight)
        }
        
        if !buttonRight2nd.isHidden
        {
            let bkgRight2 = UIView(frame: CGRect(x: frame.width - 102 - 32, y: 26, width: 32, height: 32))
            addSubview(bkgRight2)
            bkgRight2.ng_shapeCornerAll(16)
            bkgRight2.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubview(toFront: buttonRight2nd)
        }
    }
    
    /**
     设置半透明
     
     - parameter alpha: 透明度
     */
    open func makeAlpha(with alpha:CGFloat)
    {
        background.backgroundColor = background.backgroundColor?.withAlphaComponent(alpha)
        line.backgroundColor = line.backgroundColor?.withAlphaComponent(alpha)
        labelTitle.textColor = labelTitle.textColor?.withAlphaComponent(alpha)
    }
    
    /**
     设置右侧按钮可见性
     
     - parameter visible: 是否可见
     */
    open func setRightButtonVisible(with visible:Bool)
    {
        buttonRight.isHidden = !visible
        bkgRight.isHidden = !visible
    }

    // MARK:
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var background:UIView!
    fileprivate var bkgRight:UIView!
    fileprivate var line:UIView!

    fileprivate func p_init(with frame:CGRect)
    {
        background = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        addSubview(background)
        
        // 设置背景色
        background.backgroundColor = UIColor.ngColorNaviBackground()
        backgroundColor = UIColor.clear
        
        // 标题
        labelTitle = UILabel(frame: CGRect(x: 60, y: 20, width: UIScreen.ng_width() - 120, height: 44))
        addSubview(labelTitle)
        
        // 左侧按钮
        buttonLeft = UIButton(frame: CGRect(x: 5, y: 20, width: 44, height: 44))
        addSubview(buttonLeft)
        buttonLeft.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        // 右侧第一个按钮
        buttonRight = UIButton(frame: CGRect(x: frame.width - 44 - 5, y: 20, width: 44, height: 44))
        addSubview(buttonRight)
        buttonRight.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        // 右侧第二个按钮
        buttonRight2nd = UIButton(frame: CGRect(x: frame.width - 44 - 64, y: 20, width: 44, height: 44))
        addSubview(buttonRight2nd)
        buttonRight2nd.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        buttonRight2nd.isHidden = true
        buttonLeft.isHidden = true
        buttonRight.isHidden = true

        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        labelTitle.textColor = UIColor.black
        
        buttonLeft.setImage(NGNaviBar.leftButtonImage, for: UIControlState())
        
        line = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: UIScreen.ng_width(), height: 1))
        line.backgroundColor = UIColor.ngColorNaviLine()
        addSubview(line)
    }
}
