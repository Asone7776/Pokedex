//
//  HorizontalBarChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

class DummyViewController: UIViewController,ChartViewDelegate {
    
    var chartView = HorizontalBarChartView();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .red;
        view.addSubview(chartView);
        chartView.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            chartView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: chartView.safeAreaLayoutGuide.trailingAnchor, multiplier: 1),
            chartView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: chartView.bottomAnchor, multiplier: 1)
        ])
        // Do any additional setup after loading the view.
        self.title = "Horizontal Bar Char"
        //        self.options = [.toggleValues,
        //                        .toggleIcons,
        //                        .toggleHighlight,
        //                        .animateX,
        //                        .animateY,
        //                        .animateXY,
        //                        .saveToGallery,
        //                        .togglePinchZoom,
        //                        .toggleAutoScaleMinMax,
        //                        .toggleData,
        //                        .toggleBarBorders]
        //
        //        self.setup(barLineChartView: chartView)
        
        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = true
        chartView.drawValueAboveBarEnabled = true
        chartView.maxVisibleCount = 60
        
        let xAxis = chartView.xAxis
               xAxis.labelPosition = .bottom
               xAxis.labelFont = .systemFont(ofSize: 10)
               xAxis.drawAxisLineEnabled = false
        xAxis.granularity = 10
               
        let leftAxis = chartView.leftAxis
        leftAxis.enabled = false;
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawGridLinesEnabled = false
        leftAxis.axisMinimum = 0
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = false
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.drawAxisLineEnabled = false
        rightAxis.axisMinimum = 0
        
//        let l = chartView.legend
//        l.horizontalAlignment = .left
//        l.verticalAlignment = .bottom
//        l.orientation = .horizontal
//        l.drawInside = false
//        l.form = .square
//        l.formSize = 8
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
//        l.xEntrySpace = 4
        //        chartView.legend = l
        
        chartView.fitBars = true
        
        setDataCount(10, range: 25);
//        chartView.animate(yAxisDuration: 2.5)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let barWidth = 3.0
        let spaceForBar = 10.0
        
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult))
            return BarChartDataEntry(x: Double(i)*spaceForBar, y: val)
        }
        
        let set1 = BarChartDataSet(entries: yVals, label: "DataSet")
        set1.drawIconsEnabled = false
        set1.setColor(.red)
        set1.label = nil
        
        let data = BarChartData(dataSet: set1)
        data.setValueTextColor(.red)
        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        data.barWidth = barWidth
        
        chartView.data = data
    }
    
    
}
