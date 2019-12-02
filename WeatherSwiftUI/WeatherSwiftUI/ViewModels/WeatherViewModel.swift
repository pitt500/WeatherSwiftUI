//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by projas on 12/2/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
  private var service: WeatherService!
  @Published var weather: Weather?
  
  init() {
    self.service = WeatherService()
  }
  
  var temperature: String {
    if let temp = self.weather?.temperature {
      return String(format: "%.0f", temp)
    }
    
    return ""
  }
  
  var humidity: String {
    if let humidity = self.weather?.humidity {
      return String(format: "%.0f", humidity)
    }
    
    return ""
  }
  
  var cityName = ""
  
  func search() {
    if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
      fetchWeather(by: city)
    }
  }
  
  private func fetchWeather(by city: String) {
    self.service.getWeather(city: city) { weather in
      
      DispatchQueue.main.async {
        self.weather = weather
        
        if weather == nil {
          self.cityName = "Error"
        }
      }
    }
  }
}
