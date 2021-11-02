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
    var homeObj :HomeVC?
    //created an instance for CLLocationManager
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    //implemamtation of protocol HomeDelegate
    func homeDelegate(obj: HomeVC) {
        homeObj = obj
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
        ApiManager.sharedApi.dataFetch { json  in
            NetworkManager.sharedNetwork.conditionId = (json?.weather[0].id)!
            let weatherName = json?.weather[0].weatherDescription
            let weatherImageName =  weatherName?.components(separatedBy: " ")
            let image = "\(weatherImageName![0])-\(weatherImageName![1])"
            
            DispatchQueue.main.async {
                self.homeObj?.placeLabel.text = json?.name
                self.homeObj?.weatherLabel.text = json?.weather[0].main
               
                let roundedTempValue = json?.main.temp
                self.homeObj?.tempLabel.text = String(String(format: "%.0f", (roundedTempValue?.rounded())!))
                self.homeObj?.iconImage.image = UIImage(imageLiteralResourceName:"clear-sky")
            }
            
           
        }
    }
    
    
   

    
    
}



    
    
    
    
    
    
    
    
    
    

