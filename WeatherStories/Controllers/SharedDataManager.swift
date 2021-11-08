//
//  NetworkManager.swift
//  WeatherStories
//
//  Created by Robin George on 01/11/21.
//

import Foundation
import UIKit

class SharedDataManager{
    var currentLatitude : String?
    var currentLongitude : String?
    var currentPlaceName : String?
    var currentWeather : String?
    var currentTemp : Double?
    var conditionId = Int()
    var currntApiObj : WeatherResponse?
    var dailyObj : [Daily]?
    
    static var sharedNetwork = SharedDataManager()
    
    var conditionImage : String {
         switch conditionId {
         case 200...232:
             return "thunderstorms-rain"
         case 300...321:
             return "drizzle"
         case 500...531:
             return "rain"
         case 600...622:
             return "snow"
         case 701...781:
             return "fog"
         case 800:
             return "clear-day"
         case 801...804:
             return "lightning-bolt"
         default:
             return "cloudy"
         }
     }
    func coordinates(lat : String,long : String){
        self.currentLatitude = lat
        self.currentLongitude = long
        
        
    }
    func dailyData(data:[Daily]? ){
        
        dailyObj = data
        
        
    }
   

}


