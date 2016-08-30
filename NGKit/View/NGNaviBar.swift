//
//  NGNaviBar.swift
//  NGKit
//
//  Created by nagi on 16/8/30.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import UIKit

class NGNaviBar: UIView {

    // 标题栏
    var labelTitle:UILabel!
    // 左侧按钮
    var buttonLeft:UIButton!
    // 右侧按钮
    var buttonRight:UIButton!
    // 右侧按钮2
    var buttonRight2nd:UIButton!
    
    /// 左侧返回按钮图标
    static var leftButtonImage:UIImage?;
    
    // MARK: 外部接口
    
    /**
     以默认位置尺寸创建 顶部 （0, 0, width, 64）
     */
    init()
    {
        let rect = CGRectMake(0, 0, UIScreen.ng_width(), 64)
        super.init(frame: rect)
        p_init(with: rect)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        p_init(with: frame)
    }
    
    /**
     将按钮变成带灰底的圆形按钮
     */
    func makeButtonRound()
    {
        if !buttonLeft.hidden
        {
            let bkgLeft = UIView(frame: CGRectMake(11, 26, 32, 32))
            addSubview(bkgLeft)
            bkgLeft.ng_shapeCornerAll(16)
            bkgLeft.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubviewToFront(buttonLeft)
        }
        
        if !buttonRight.hidden
        {
            bkgRight = UIView(frame: CGRectMake(frame.width - 11 - 32, 26, 32, 32))
            addSubview(bkgRight)
            bkgRight.ng_shapeCornerAll(16)
            bkgRight.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubviewToFront(buttonRight)
        }
        
        if !buttonRight2nd.hidden
        {
            let bkgRight2 = UIView(frame: CGRectMake(frame.width - 102 - 32, 26, 32, 32))
            addSubview(bkgRight2)
            bkgRight2.ng_shapeCornerAll(16)
            bkgRight2.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
            bringSubviewToFront(buttonRight2nd)
        }
    }
    
    /**
     设置半透明
     
     - parameter alpha: 透明度
     */
    func makeAlpha(with alpha:CGFloat)
    {
        background.backgroundColor = background.backgroundColor?.colorWithAlphaComponent(alpha)
        line.backgroundColor = line.backgroundColor?.colorWithAlphaComponent(alpha)
        labelTitle.textColor = labelTitle.textColor?.colorWithAlphaComponent(alpha)
    }
    
    /**
     设置右侧按钮可见性
     
     - parameter visible: 是否可见
     */
    func setRightButtonVisible(with visible:Bool)
    {
        buttonRight.hidden = !visible
        bkgRight.hidden = !visible
    }

    // MARK:
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var background:UIView!
    private var bkgRight:UIView!
    private var line:UIView!

    private func p_init(with frame:CGRect)
    {
        background = UIView(frame: CGRectMake(0, 0, frame.width, frame.height))
        addSubview(background)
        
        // 设置背景色
        background.backgroundColor = UIColor.ngColorNaviBackground()
        backgroundColor = UIColor.clearColor()
        
        // 标题
        labelTitle = UILabel(frame: CGRectMake(60, 20, UIScreen.ng_width() - 120, 44))
        addSubview(labelTitle)
        
        // 左侧按钮
        buttonLeft = UIButton(frame: CGRectMake(5, 20, 44, 44))
        addSubview(buttonLeft)
        buttonLeft.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        // 右侧第一个按钮
        buttonRight = UIButton(frame: CGRectMake(frame.width - 44 - 5, 20, 44, 44))
        addSubview(buttonRight)
        buttonRight.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        // 右侧第二个按钮
        buttonRight2nd = UIButton(frame: CGRectMake(frame.width - 44 - 64, 20, 44, 44))
        addSubview(buttonRight2nd)
        buttonRight2nd.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        
        buttonRight2nd.hidden = true
        buttonLeft.hidden = true
        buttonRight.hidden = true

        labelTitle.textAlignment = .Center
        labelTitle.font = UIFont.systemFontOfSize(20)
        labelTitle.textColor = UIColor.blackColor()
        
        buttonLeft.setImage(NGNaviBar.leftButtonImage, forState: .Normal)
        
        line = UIView(frame: CGRectMake(0, frame.height - 1, UIScreen.ng_width(), 1))
        line.backgroundColor = UIColor.ngColorNaviLine()
        addSubview(line)
    }
}
