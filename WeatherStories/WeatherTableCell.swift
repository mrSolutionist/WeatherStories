//
//  WeatherTableCell.swift
//  WeatherStories
//
//  Created by Robin George on 03/11/21.
//

import UIKit

class WeatherTableCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var date = Date()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateCell(obj:Daily,index:Int){
        
        if index == 0{
            dayLabel.text = "Today"
            let weatherObj = NetworkManager.sharedNetwork.currntApiObj
            weatherLabel.text = weatherObj?.weather[0].main
            NetworkManager.sharedNetwork.conditionId = weatherObj?.weather[0].id ?? 0
            weatherIcon.image = UIImage(imageLiteralResourceName:NetworkManager.sharedNetwork.conditionImage)
            maxLabel.text = "\(weatherObj?.main.tempMax)°"
            minLabel.text = "\(weatherObj?.main.tempMin)°"
            
           
        }
        else {
            let timeStamp = obj.dt
            let day = getDay(timeStamp: timeStamp)
            dayLabel.text = day
            weatherLabel.text = obj.weather[0].main
            NetworkManager.sharedNetwork.conditionId = obj.weather[0].id
            weatherIcon.image = UIImage(imageLiteralResourceName:NetworkManager.sharedNetwork.conditionImage)
            maxLabel.text = "\(String(obj.temp.max))°"
            minLabel.text = "\(String(obj.temp.min))°"
        }
        
    }
    
    func getDay(timeStamp:Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(for: date)!
    }
    
}
