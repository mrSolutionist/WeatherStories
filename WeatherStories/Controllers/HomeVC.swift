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

class HomeVC: UIViewController,CLLocationManagerDelegate, UICollectionViewDelegate{
    
    @IBOutlet weak var dailyWeatherTable: UITableView!
    
 
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var collectionView: CustomCollectionView!
    //create a variable for protocole HomeDelegate
    
    
    var delegate : HomeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView Delegate
        dailyWeatherTable.dataSource = self
        
        //locationManager  Delegate
        LocationManagerFiles.sharedLocation.delegate = self
        
        //CollectionView Delegate
        collectionView.delegate = self
        
       
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
//table view implimentation
extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.sharedNetwork.dailyObj?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableCell
        
        let dailyObj = NetworkManager.sharedNetwork.dailyObj?[indexPath.row]
       
        cell.updateCell(obj: dailyObj!,index:indexPath.row)
        
        return cell
    }
    
}

//collectionaview implimentation

extension HomeVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }
    
    
}

//after data is added to DailyWeather object 'dailyObj' this is used to reload weather table view
extension HomeVC: LocationDelegate{
    func weatherTableDelegate() {
        DispatchQueue.main.async {
            self.dailyWeatherTable.reloadData()
        }
        
    }
    
    
}
