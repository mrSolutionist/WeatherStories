//
//  NetworkManager.swift
//  WeatherStories
//
//  Created by Robin George on 01/11/21.
//

import Foundation

class NetworkManager{
    var currentLatitude : String?
    var currentLongitude : String?
    static var sharedNetwork = NetworkManager()
//    private init(){
////        self.currentLongitude = long
////        self.currentLatitude = lat
////    }
//    }

    
    
    func coordinates(lat : String,long : String){
        self.currentLatitude = lat
        self.currentLongitude = long
        
        
    }
}

