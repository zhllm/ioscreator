//
//  LineViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/6/7.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import Charts

class LineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let values1: [Double] = [8, 104, 81, 93, 52, 44]
        let values2: [Double] = [76, 25, 20, 13, 52, 57]
        let values3: [Double] = [101, 75, 28, 23, 45, 91]
        
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
        
        let dateSet = LineChartDataSet(entries: entries1, label: "Company A")
        dateSet.setColor(NSUIColor(displayP3Red: 229/255, green: 148/255, blue: 154/255, alpha: 1))
        dateSet.drawCirclesEnabled = false
        dateSet.lineWidth = 3.0
        
        let dateSet2 = LineChartDataSet(entries: entries2, label: "Company B")
        dateSet2.setColor(NSUIColor(displayP3Red: 243/255, green: 209/255, blue: 142/255, alpha: 1))
        // dateSet.drawCirclesEnabled = false
        // dateSet.lineWidth = 4.0
        dateSet2.circleRadius = 4.0
        dateSet2.setCircleColor(NSUIColor(displayP3Red: 243/255, green: 209/255, blue: 142/255, alpha: 1))
        
        let dateSet3 = LineChartDataSet(entries: entries3, label: "Company C")
        dateSet3.setColor(NSUIColor(displayP3Red: 172/255, green: 234/255, blue: 254/255, alpha: 1))
        dateSet.lineWidth = 3.0
        
        let data = LineChartData(dataSets: [dateSet, dateSet2, dateSet3])
        
        let chart = LineChartView(frame: CGRect(x: 0, y: 40, width: 560, height: 240))
        chart.backgroundColor = .clear
        chart.leftAxis.axisMinimum = 0
        chart.rightAxis.axisMinimum = 0
        chart.data = data
        self.view.addSubview(chart)
    }

}
