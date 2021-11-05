//
//  ApiFileManager.swift
//  WeatherStories
//
//  Created by Robin George on 01/11/21.
//

import Foundation

class ApiManager{
   
    
    
    
    static var  sharedApi = ApiManager()
    
    let lat  = NetworkManager.sharedNetwork.currentLatitude
    let long = NetworkManager.sharedNetwork.currentLongitude
    
    func dataFetch(complition:@escaping (_ json:WeatherResponse?)->()){
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat!)&lon=\(long!)&appid=204b1d948b2e95121c20af820c73e4b8&units=metric")
        URLSession.shared.dataTask(with: url!) { data, resp, err in
            
            guard let data = data else{
                return
            }
            let jsonObj = try! JSONDecoder().decode(WeatherResponse.self, from: data)
            NetworkManager.sharedNetwork.currntApiObj = jsonObj
            complition(jsonObj)
            
        }.resume()
        
    }
    
    
}

