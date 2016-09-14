//
//  NGTimePickerView.swift
//  NGKit
//
//  Created by nagi on 16/8/30.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import UIKit

open class NGTimePickerView: UIView , UIPickerViewDataSource,  UIPickerViewDelegate {

    open var pickerHour:UIPickerView!
    open var pickerMinute:UIPickerView!
    open var pickerSecond:UIPickerView!
        
    convenience public init(with frame:CGRect, time seconds:NSInteger)
    {
        self.init(frame: frame)
        backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
        let backView = UIView(frame: frame)
        addSubview(backView)
        backView.tag = NGTimePickerView.tagBackground
        backView.backgroundColor = UIColor.white
        
        let perWidth = (frame.width - 20)/3*0.6
        pickerHour = UIPickerView(frame: CGRect(x: 10, y: 10, width: perWidth, height: frame.height - 20))
        pickerMinute = UIPickerView(frame: CGRect(x: 10 + (frame.width - 20)/3, y: 10, width: perWidth, height: frame.height - 20))
        pickerSecond = UIPickerView(frame: CGRect(x: 10 + (frame.width - 20)/3*2, y: 10, width: perWidth, height: frame.height - 20))
        
        addSubview(pickerHour)
        addSubview(pickerMinute)
        addSubview(pickerSecond)
        
        pickerHour.delegate = self
        pickerMinute.delegate = self
        pickerSecond.delegate = self
        
        let labelHour = UILabel(frame: CGRect(x: 10 + (frame.width - 20)/3*0.6, y: 10, width: (frame.width - 20)/3*0.4, height: frame.height - 20))
        addSubview(labelHour)
        labelHour.font = UIFont.systemFont(ofSize: 15)
        labelHour.textAlignment = .center
        labelHour.text = "时"
        
        let labelMinute = UILabel(frame: CGRect(x: 10 + (frame.width - 20)/3*1.6, y: 10, width: (frame.width - 20)/3*0.4, height: frame.height - 20))
        addSubview(labelMinute)
        labelMinute.font = UIFont.systemFont(ofSize: 15)
        labelMinute.textAlignment = .center
        labelMinute.text = "分"
        
        let labelSecond = UILabel(frame: CGRect(x: 10 + (frame.width - 20)/3*2.6, y: 10, width: (frame.width - 20)/3*0.4, height: frame.height - 20))
        addSubview(labelSecond)
        labelSecond.font = UIFont.systemFont(ofSize: 15)
        labelSecond.textAlignment = .center
        labelSecond.text = "秒"
        
        pickerHour.selectRow(seconds/3600/10, inComponent: 0, animated: true)
        pickerHour.selectRow(seconds/3600%10, inComponent: 1, animated: true)
        pickerMinute.selectRow(seconds%3600/60/10, inComponent: 0, animated: true)
        pickerMinute.selectRow(seconds%3600/60%10, inComponent: 1, animated: true)
        pickerSecond.selectRow(seconds%3600%60/10, inComponent: 0, animated: true)
        pickerSecond.selectRow(seconds%3600%60%10, inComponent: 1, animated: true)
    }

    open func getTimeSeconds() -> NSInteger
    {
        var seconds = 0
        seconds += pickerHour.selectedRow(inComponent: 0)*10*3600
        seconds += pickerHour.selectedRow(inComponent: 1)*3600
        seconds += pickerMinute.selectedRow(inComponent: 0)*10*60
        seconds += pickerMinute.selectedRow(inComponent: 1)*60
        seconds += pickerSecond.selectedRow(inComponent: 0)*10
        seconds += pickerSecond.selectedRow(inComponent: 1)
        return seconds
    }
    
    // MARK: pickerView delegate
    
    open func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        let backView = ng_getFirstSubView(by: NGTimePickerView.tagBackground, recurison: false)
        return (backView!.frame.width - 20)/3*0.3
    }
    
    open func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 25
    }
    
    open func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    open func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == pickerHour && component == 0
        {
            return 3
        }
        else if component == 0
        {
            return 7
        }
        
        return 10
    }
    
    open func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let perWidth = (UIScreen.ng_width() - 20)/3*0.6
        let myView = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: perWidth, height: 30))
        myView.textAlignment = .center
        myView.text = "\(row)"
        myView.font = UIFont.systemFont(ofSize: 14)
        myView.backgroundColor = UIColor.clear
        return myView
    }
    
    fileprivate static let tagBackground = 9527

}
