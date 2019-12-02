//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by projas on 12/2/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

class WeatherService {
  
  private let baseURL = "http://api.openweathermap.org/data"
  private let versionAPI = "2.5"
  private let typeAPI = "weather"
  private let apiKey = "08f1026c76f4309cf4754009e10eac06"
  
  func getWeather(city: String, completion: @escaping (Weather?) -> Void) {
    let stringUrl = "\(baseURL)/\(versionAPI)/\(typeAPI)?q=\(city)&appid=\(apiKey)&units=metric"
    guard let url = URL(string: stringUrl) else {
      completion(nil)
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in

      guard let data = data, error == nil,
        let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        completion(nil)
        return
      }
      
      let weather = try? JSONDecoder().decode(Weather.self, from: data)
      completion(weather)
      
    }.resume()
  }
}
