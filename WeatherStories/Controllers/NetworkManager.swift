//
//  NetworkManager.swift
//  WeatherStories
//
//  Created by Robin George on 01/11/21.
//

import Foundation
import UIKit

class NetworkManager{
    var currentLatitude : String?
    var currentLongitude : String?
    var currentPlaceName : String?
    var currentWeather : String?
    var currentTemp : Double?
    var conditionId = Int()
    static var sharedNetwork = NetworkManager()
    
    var conditionImage : String {
         switch conditionId {
         case 200...232:
             return "cloud.bolt.rain"
         case 300...321:
             return "cloud.drizzle"
         case 500...531:
             return "cloud.rain"
         case 600...622:
             return "cloud.snow"
         case 701...781:
             return "cloud.fog"
         case 800:
             return "sun.max"
         case 801...804:
             return "cloud.blot"
         default:
             return "cloud"
         }
     }
    func coordinates(lat : String,long : String){
        self.currentLatitude = lat
        self.currentLongitude = long
        
        
    }
    

}


