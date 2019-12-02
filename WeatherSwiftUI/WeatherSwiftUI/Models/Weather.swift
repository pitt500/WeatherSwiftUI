//
//  Weather.swift
//  WeatherSwiftUI
//
//  Created by projas on 12/2/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

enum WeatherError: Error {
  case decodableError
}

struct Weather: Decodable {
  var temperature: Double
  var humidity: Double
  var maxTemperature: Double
  var minTemperature: Double
  
  enum WeatherKeys: String, CodingKey {
    case main
  }
  
  enum MainKeys: String, CodingKey {
    case temperature = "temp"
    case humidity
    case minTemperature = "temp_min"
    case maxTemperature = "temp_max"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: WeatherKeys.self)
    
    if let main = try? container.nestedContainer(keyedBy: MainKeys.self, forKey: .main) {
      self.temperature = try main.decode(Double.self, forKey: .temperature)
      self.humidity = try main.decode(Double.self, forKey: .humidity)
      self.minTemperature = try main.decode(Double.self, forKey: .minTemperature)
      self.maxTemperature = try main.decode(Double.self, forKey: .maxTemperature)
    } else {
      throw WeatherError.decodableError
    }
  }
}
