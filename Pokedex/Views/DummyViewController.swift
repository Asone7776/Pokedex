//
//  HorizontalBarChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import SwiftUI

struct DummyViewController: View {
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.00)).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Hello, world!")
                    .padding()
                    .font(Font.largeTitle)
                    .foregroundColor(Color.white)
                Image("pokemon")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DummyViewController()
            .previewDevice("iPhone XS")
    }
}
