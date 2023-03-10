//
//  PokemonCharacteristicsView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit
import Charts
class PokemonCharacteristicsView: UIView {
    let chartView = HorizontalBarChartView();
    
    var items = [Stats]();
    var color:UIColor?;
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension PokemonCharacteristicsView {
    private func setupChart(){
        chartView.translatesAutoresizingMaskIntoConstraints = false;
        chartView.drawBarShadowEnabled = true
        chartView.drawValueAboveBarEnabled = true
        chartView.legend.enabled = false;
        
     
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = false
        xAxis.granularity = 1
        xAxis.labelTextColor = color ?? UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00)
        xAxis.labelFont = UIFont.boldSystemFont(ofSize: 12)
        xAxis.valueFormatter = IndexAxisValueFormatter(values: items.map { "\($0.stat.getShortCut())  \($0.base_stat)" })
        
        chartView.leftAxis.enabled = false;
        chartView.rightAxis.enabled = false;
        chartView.fitBars = true
        chartView.animate(yAxisDuration: 1.5)
    }
    
    private func setupData() {
        let barWidth = 0.3
        let dataEntries = items.map{ $0.transformToBarChartDataEntry() }
        
        let set1 = BarChartDataSet(entries: dataEntries)
        set1.highlightAlpha = 1
        set1.drawIconsEnabled = false
        set1.setColor(color ?? UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00))
        set1.label = nil
        
        let data = BarChartData(dataSet: set1)
        data.setDrawValues(true)
        data.setValueTextColor(color ?? UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00))
        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        data.barWidth = barWidth
        chartView.data = data
    }
    private func layout(){
        addSubview(chartView);
        NSLayoutConstraint.activate([
            chartView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chartView.trailingAnchor, multiplier: 1),
            chartView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: chartView.bottomAnchor, multiplier: 1),
            chartView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    func configure(selectedColor:UIColor?, stats:[Stats]?){
        if let stats = stats{
            if let selectedColor = selectedColor{
                color = selectedColor;
            }
            self.items = stats;
            setupChart();
            setupData();
        }
    }
}
