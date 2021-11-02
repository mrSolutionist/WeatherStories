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
    
    func dataFetch(complition: @escaping (_ json:Welcome?,_ flag:Int)->()){
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat!)&lon=\(long!)&appid=7a6f50d61e91ebe14eca463f3afd0895")
        URLSession.shared.dataTask(with: url!) { data, resp, err in
            
            guard let data = data else{
                return
            }
            let jsonObj = try! JSONDecoder().decode(Welcome.self, from: data)
            
            complition(jsonObj, 1)
            
        }.resume()
        
    }
    
    
}

