//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by projas on 12/2/19.
//  Copyright © 2019 projas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var weatherViewModel: WeatherViewModel
  
  init() {
    self.weatherViewModel = WeatherViewModel()
  }
  
  
  var body: some View {
    VStack(alignment: .center) {
      TextField("Enter city name", text: self.$weatherViewModel.cityName) {
        self.weatherViewModel.search()
      }.font(.custom("Arial", size: 50))
        .padding()
        .fixedSize()
      
      Text(self.weatherViewModel.temperature)
        .offset(y: 100)
        .font(.custom("Arial", size: 50))
        .foregroundColor(Color.white)
        .offset(y: -100)
        .padding()
      
      
    }.frame(minWidth: 0, maxWidth: .infinity,
            minHeight: 0, maxHeight: .infinity)
      .background(Color.green)
      .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
