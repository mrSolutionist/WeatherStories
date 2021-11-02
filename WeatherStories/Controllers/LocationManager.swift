//
//  LocationFile.swift
//  WeatherStories
//
//  Created by Robin George on 31/10/21.
//

import Foundation
import CoreLocation
import UIKit


class LocationManagerFiles:HomeDelegate{
    
    static let sharedLocation = LocationManagerFiles()
    
    //created an instance for CLLocationManager
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    //implemamtation of protocol HomeDelegate
    func homeDelegate(obj: HomeVC) {
        locationManager.delegate = obj as CLLocationManagerDelegate
    }
    
    
    func setupLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func requestWeatherForLocation(){
       
        guard let currentLocation = currentLocation else {
            return
        }
        
        
       let long = String(currentLocation.coordinate.longitude)
        let lat = String(currentLocation.coordinate.latitude)
        NetworkManager.sharedNetwork.coordinates(lat: lat, long: long)
        ApiManager.sharedApi.dataFetch { json,arg  in
            NetworkManager.sharedNetwork.jsonDatas(name: json!.name, weather: json!.base,setFlag: arg)
           
        }
    }
    
    
   

    
    
}



    
    
    
    
    
    
    
    
    
    

