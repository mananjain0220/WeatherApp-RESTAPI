//
//  weather.swift
//  weatherApp
//
//  Created by manan jain on 15/05/24.
//

import Foundation

struct WeatherResponse: Codable {
    var main: WeatherMain
    var weather: [WeatherDescription]
}

struct WeatherMain: Codable {
    var temp: Double
    var pressure: Double
    var humidity: Double
}

struct WeatherDescription: Codable {
    var description: String
}
