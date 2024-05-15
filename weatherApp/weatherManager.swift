//
//  weatherManager.swift
//  weatherApp
//
//  Created by manan jain on 15/05/24.
//


import Foundation

public class WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=youAPIkey&units=metric"

    func fetchWeather(cityName: String, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        let urlString = "\(weatherURL)&q=\(cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? cityName)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.network))
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }
}

enum WeatherError: Error {
    case network
    case decoding
    case badURL
}
