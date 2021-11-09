//
//  CustomCollectionViewCell.swift
//  WeatherStories
//
//  Created by Robin George on 06/11/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var collectionData : CollectionComponentsModel?
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var texlLabel: UILabel!
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    
    func collectionConfigure() -> [CollectionComponentsModel]
    {
        let dailyObj = SharedDataManager.sharedNetwork.dailyObj
        let collection : [CollectionComponentsModel] = [CollectionComponentsModel.init(name: "HUMIDITY", intRange: dailyObj?[0].humidity, doubleRange:nil, imageName: "humidity"),CollectionComponentsModel.init(name: "PRESSURE", intRange: dailyObj?[0].pressure, doubleRange: nil, imageName: "pressure-high-alt"),CollectionComponentsModel.init(name:"UV INDEX", intRange: nil, doubleRange: dailyObj?[0].uvi, imageName: "uv-index"),CollectionComponentsModel.init(name:"FEELS LIKE :IN DAY", intRange: nil, doubleRange: dailyObj?[0].feelsLike.day, imageName: "dust-night"),CollectionComponentsModel.init(name: "Moonset", intRange: dailyObj?[0].moonset, doubleRange:nil, imageName: "moonset"),CollectionComponentsModel.init(name: "windGust", intRange: nil, doubleRange: dailyObj?[0].windGust, imageName: "wind"),CollectionComponentsModel.init(name:"windSpeed", intRange: nil, doubleRange: dailyObj?[0].windSpeed, imageName: "windsock"),CollectionComponentsModel.init(name:"clouds", intRange: dailyObj?[0].clouds, doubleRange: nil, imageName: "cloudy")]
        return collection
        
    }
    
    func collectionCellConfigure(indexNum:Int){
        let collecton = collectionConfigure()
        let c = (collecton[indexNum].intRange != nil ? "\(collecton[indexNum].intRange ?? 0)" : "\(collecton[indexNum].doubleRange ?? 0)")
        cellLabel?.text = c
        
        texlLabel.text = collecton[indexNum].name
        
        imageIcon.image = UIImage(named: collecton[indexNum].imageName!)
        
    }
}

