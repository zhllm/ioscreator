//
//  CharViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/6/7.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import Charts

class CharViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let values1: [Double] = [8, 104, 81, 93, 52, 44]
        let values2: [Double] = [76, 25, 20, 13, 52, 57]
        let values3: [Double] = [81, 75, 28, 23, 45, 91]
        
        var entries1: [ChartDataEntry] = Array()
        var entries2: [ChartDataEntry] = Array()
        var entries3: [ChartDataEntry] = Array()
        for (i, value) in values1.enumerated() {
            entries1.append(BarChartDataEntry(x: Double(i), y: value))
        }
        
        for (i, value) in values2.enumerated() {
            entries2.append(BarChartDataEntry(x: Double(i), y: value))
        }
        
        
        for (i, value) in values3.enumerated() {
            entries3.append(BarChartDataEntry(x: Double(i), y: value))
        }
        
        let dateSet = BarChartDataSet(entries: entries1, label: "Company A")
        dateSet.setColor(NSUIColor(displayP3Red: 229/255, green: 148/255, blue: 154/255, alpha: 1))
        
        let dateSet2 = BarChartDataSet(entries: entries2, label: "Company B")
        dateSet2.setColor(NSUIColor(displayP3Red: 243/255, green: 209/255, blue: 142/255, alpha: 1))
        
        
        let dateSet3 = BarChartDataSet(entries: entries3, label: "Company C")
        dateSet3.setColor(NSUIColor(displayP3Red: 172/255, green: 234/255, blue: 254/255, alpha: 1))
        
        let data = BarChartData(dataSets: [dateSet, dateSet2, dateSet3])
        data.barWidth = 0.25
        let char = BarChartView(frame: CGRect(x: 0, y: 40, width: 560, height: 240))
        char.backgroundColor = .red
        char.leftAxis.axisMinimum = 0.0
        char.rightAxis.axisMinimum = 0.0
        char.data = data
        // 强制将自元素进行组合，并忽略他们在屏幕上的位置
        char.shouldGroupAccessibilityChildren = true
        // 在x轴方向能被拖动的距离
        char.setDragOffsetX(100)
        // 允许被缩放
        char.setScaleEnabled(true)
        // 在可视区域内展示全部的内容
        char.fitBars = true
        
        char.groupBars(fromX: -1, groupSpace: 0.2, barSpace: 0.05)
        self.view.addSubview(char)
    }
    

}
