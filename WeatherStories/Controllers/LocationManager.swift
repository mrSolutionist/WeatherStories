//
//  LocationFile.swift
//  WeatherStories
//
//  Created by Robin George on 31/10/21.
//

import Foundation
import CoreLocation
import UIKit

protocol LocationDelegate{
    func weatherTableDelegate()
}
class LocationManagerFiles:HomeDelegate{
    
    static let sharedLocation = LocationManagerFiles()
    
    
    var homeObj :HomeVC?
    //created an instance for CLLocationManager
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var delegate : LocationDelegate?
    
    
    
    
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

            
           
            
            
            DispatchQueue.main.async {
                self.homeObj?.placeLabel.text = json?.name
                self.homeObj?.weatherLabel.text = json?.weather[0].main
                self.homeObj?.maxTemp.text = "\(String((json?.main.tempMax)!))°"
                self.homeObj?.minTemp.text = "\(String((json?.main.tempMin)!))°"
                let roundedTempValue = json?.main.temp
                self.homeObj?.tempLabel.text = "\(String(format: "%.0f",roundedTempValue!))°"
                self.homeObj?.iconImage.image = UIImage(imageLiteralResourceName:NetworkManager.sharedNetwork.conditionImage)
            }
            
           
        }
        
        //for passing data to the common class and delegate is called once data is transfered to reload the table view
        DailyApi.sharedApi.dataFetch { json in
            NetworkManager.sharedNetwork.dailyData(data: json?.daily)
            self.delegate?.weatherTableDelegate()
        }
       
    }
    
    
   

    
    
}



    
    
    
    
    
    
    
    
    
    

