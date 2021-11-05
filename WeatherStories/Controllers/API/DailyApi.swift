//
//  ApiFileManager.swift
//  WeatherStories
//
//  Created by Robin George on 01/11/21.
//

import Foundation

class DailyApi{
   
    
    
    
    static var  sharedApi = DailyApi()
    
    let lat  = NetworkManager.sharedNetwork.currentLatitude
    let long = NetworkManager.sharedNetwork.currentLongitude
    
    func dataFetch(complition:@escaping (_ json:DailyWeatherModel?)->()){
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat!)&lon=\(long!)&exclude=hourly,minutely,current&appid=204b1d948b2e95121c20af820c73e4b8&units=metric")
        URLSession.shared.dataTask(with: url!) { data, resp, err in
            
            guard let data = data else{
                return
            }
            let dailyObj = try! JSONDecoder().decode(DailyWeatherModel.self, from: data)
            
            //completion handler is used to pass data once the data is fetched from api
            
            complition(dailyObj)
            
        }.resume()
        
    }
    
    
}

