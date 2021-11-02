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
    
    static var sharedNetwork = NetworkManager()


    
    
    func coordinates(lat : String,long : String){
        self.currentLatitude = lat
        self.currentLongitude = long
        
        
    }
    
    //not needed now
//
//    func jsonDatas(name:String,weather:String){
//
//        currentPlaceName = name
//        currentWeather = weather
////        currentTemp = temp
//    }
}

struct Model{
    var currentLatitude : String?
    var currentLongitude : String?
    var currentPlaceName : String?
    var currentWeather : String?
    var currentTemp : Double?
}
