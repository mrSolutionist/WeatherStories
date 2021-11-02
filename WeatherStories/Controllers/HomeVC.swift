//
//  HomeVC.swift
//  WeatherStories
//
//  Created by Robin George on 31/10/21.
//

import UIKit
import CoreLocation


//protocol for passing current VC (HOMEVC) obj to locationManagerDelegate
//this passes the obj of HOMEVC
protocol HomeDelegate{
    func homeDelegate(obj:HomeVC)
}

class HomeVC: UIViewController,CLLocationManagerDelegate{
    
    
 
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var minTemp: UILabel!
    
    @IBOutlet weak var maxTemp: UILabel!
    //create a variable for protocole HomeDelegate
    var delegate : HomeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        LocationManagerFiles.sharedLocation.setupLocation()
        
        //created an object of locationFetch class and passed to delegate variable
        //why?
        delegate = LocationManagerFiles.sharedLocation
        // whats happening here?
        delegate?.homeDelegate(obj: self)
        
    }
    //implemnetation of location delegate 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !locations.isEmpty {
            LocationManagerFiles.sharedLocation.currentLocation = locations.first
            LocationManagerFiles.sharedLocation.locationManager.stopUpdatingLocation()
            LocationManagerFiles.sharedLocation.requestWeatherForLocation()
        }
    }
    
   
    
   
}
