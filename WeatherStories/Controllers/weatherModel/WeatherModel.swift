// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherResponse = try? newJSONDecoder().decode(WeatherResponse.self, from: jsonData)

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let coord: Coords
    let weather: [Weathers]
    let main: Mains
    let clouds: Cloudss
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Cloudss: Codable {
    let all: Int
}

// MARK: - Coord
struct Coords: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Mains: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weathers: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
