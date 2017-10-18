//
//  HSQAUtils.swift
//  west dean delicious
//
//  Created by nagi on 2016/10/17.
//  Copyright © 2016年 aria. All rights reserved.
//  Home Screen Quick Actions
//

import Foundation

@available(iOS 9.0, *)
class HSQAUtils : NSObject {
    static let instance = HSQAUtils()
    
    private override init() {  super.init() }
    
    private var items = Array<UIApplicationShortcutItem>()
    
    /// 添加一个快速启动项
    ///
    /// - parameter iconType:     系统icon类型
    /// - parameter typeIdentify: 标志
    /// - parameter title:        标题
    /// - parameter subTitle:     副标题
    func addItem(iconType:UIApplicationShortcutIconType, typeIdentify:String, title:String, subTitle:String)
    {
        if items.filter ({ (item) -> Bool in return item.type == typeIdentify }).count > 0
        {
            return
        }
        
        let icon = UIApplicationShortcutIcon.init(type: iconType)
        let item = UIApplicationShortcutItem.init(type: typeIdentify, localizedTitle: title, localizedSubtitle: subTitle, icon: icon, userInfo: nil)
        items.append(item)
        p_update()
    }
    
    
    /// 添加一个快速启动项
    ///
    /// - parameter iconName:     自定义icon名称
    /// - parameter typeIdentify: 标志
    /// - parameter title:        标题
    /// - parameter subTitle:     副标题
    func addItem(by iconName:String, typeIdentify:String, title:String, subTitle:String)
    {
        if items.filter ({ (item) -> Bool in return item.type == typeIdentify }).count > 0
        {
            return
        }
        
        let icon = UIApplicationShortcutIcon.init(templateImageName: iconName)
        let item = UIApplicationShortcutItem.init(type: typeIdentify, localizedTitle: title, localizedSubtitle: subTitle, icon: icon, userInfo: nil)
        items.append(item)
        p_update()
    }
    
    
    /// 删除项目
    ///
    /// - parameter typeIdentify: 项目标志
    func deleteItem(by typeIdentify:String)
    {
        items = items.filter({ (item) -> Bool in
            return item.type != typeIdentify
        })
        p_update()
    }
    
    
    private func p_update()
    {
        UIApplication.shared.shortcutItems = items
    }
}
