//
//  NGTimePickerView.swift
//  NGKit
//
//  Created by nagi on 16/8/30.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import UIKit

class NGTimePickerView: UIView , UIPickerViewDataSource, UIPickerViewDelegate {

    var pickerHour:UIPickerView!
    var pickerMinute:UIPickerView!
    var pickerSecond:UIPickerView!
        
    convenience init(with frame:CGRect, time seconds:NSInteger)
    {
        self.init(frame: frame)
        backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
        let backView = UIView(frame: frame)
        addSubview(backView)
        backView.tag = NGTimePickerView.tagBackground
        backView.backgroundColor = UIColor.whiteColor()
        
        let perWidth = (frame.width - 20)/3*0.6
        pickerHour = UIPickerView(frame: CGRectMake(10, 10, perWidth, frame.height - 20))
        pickerMinute = UIPickerView(frame: CGRectMake(10 + (frame.width - 20)/3, 10, perWidth, frame.height - 20))
        pickerSecond = UIPickerView(frame: CGRectMake(10 + (frame.width - 20)/3*2, 10, perWidth, frame.height - 20))
        
        addSubview(pickerHour)
        addSubview(pickerMinute)
        addSubview(pickerSecond)
        
        pickerHour.delegate = self
        pickerMinute.delegate = self
        pickerSecond.delegate = self
        
        let labelHour = UILabel(frame: CGRectMake(10 + (frame.width - 20)/3*0.6, 10, (frame.width - 20)/3*0.4, frame.height - 20))
        addSubview(labelHour)
        labelHour.font = UIFont.systemFontOfSize(15)
        labelHour.textAlignment = .Center
        labelHour.text = "时"
        
        let labelMinute = UILabel(frame: CGRectMake(10 + (frame.width - 20)/3*1.6, 10, (frame.width - 20)/3*0.4, frame.height - 20))
        addSubview(labelMinute)
        labelMinute.font = UIFont.systemFontOfSize(15)
        labelMinute.textAlignment = .Center
        labelMinute.text = "分"
        
        let labelSecond = UILabel(frame: CGRectMake(10 + (frame.width - 20)/3*2.6, 10, (frame.width - 20)/3*0.4, frame.height - 20))
        addSubview(labelSecond)
        labelSecond.font = UIFont.systemFontOfSize(15)
        labelSecond.textAlignment = .Center
        labelSecond.text = "秒"
        
        pickerHour.selectRow(seconds/3600/10, inComponent: 0, animated: true)
        pickerHour.selectRow(seconds/3600%10, inComponent: 1, animated: true)
        pickerMinute.selectRow(seconds%3600/60/10, inComponent: 0, animated: true)
        pickerMinute.selectRow(seconds%3600/60%10, inComponent: 1, animated: true)
        pickerSecond.selectRow(seconds%3600%60/10, inComponent: 0, animated: true)
        pickerSecond.selectRow(seconds%3600%60%10, inComponent: 1, animated: true)
    }

    func getTimeSeconds() -> NSInteger
    {
        var seconds = 0
        seconds += pickerHour.selectedRowInComponent(0)*10*3600
        seconds += pickerHour.selectedRowInComponent(1)*3600
        seconds += pickerMinute.selectedRowInComponent(0)*10*60
        seconds += pickerMinute.selectedRowInComponent(1)*60
        seconds += pickerSecond.selectedRowInComponent(0)*10
        seconds += pickerSecond.selectedRowInComponent(1)
        return seconds
    }
    
    // MARK: pickerView delegate
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        let backView = ng_getFirstSubView(by: NGTimePickerView.tagBackground, recurison: false)
        return (backView!.frame.width - 20)/3*0.3
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 25
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
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
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let perWidth = (UIScreen.ng_width() - 20)/3*0.6
        let myView = UILabel(frame: CGRectMake(0.0, 0.0, perWidth, 30))
        myView.textAlignment = .Center
        myView.text = "\(row)"
        myView.font = UIFont.systemFontOfSize(14)
        myView.backgroundColor = UIColor.clearColor()
        return myView
    }
    
    private static let tagBackground = 9527

}
