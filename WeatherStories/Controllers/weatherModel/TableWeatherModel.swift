//
//  TableWeatherModel.swift
//  WeatherStories
//
//  Created by Robin George on 03/11/21.
//

import Foundation


struct TableWeatherModel{
    
    var day:String
    var weatherCondition: String
    var minTemp : Int
    var maxTemp : Int
    var icon : String
    
    init (day : String, weatherCondition : String, minTemp : Int, maxTemp : Int, icon : String){
        self.day = day
        self.weatherCondition = weatherCondition
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.icon = icon
    }
}
