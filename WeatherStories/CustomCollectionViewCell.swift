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
    
    
    func collectionConfigure() -> [CollectionComponentsModel]
    {
        let dailyObj = SharedDataManager.sharedNetwork.dailyObj
       
        
        let collection : [CollectionComponentsModel] = [CollectionComponentsModel.init(name: "HUMIDITY", intRange: dailyObj?[0].humidity, doubleRange:nil),CollectionComponentsModel.init(name: "PRESSURE", intRange: dailyObj?[0].pressure, doubleRange: nil),CollectionComponentsModel.init(name:"UV INDEX", intRange: nil, doubleRange: dailyObj?[0].uvi),CollectionComponentsModel.init(name:"FEELS LIKE :IN DAY", intRange: nil, doubleRange: dailyObj?[0].feelsLike.day)]
        return collection
        
    }
    
    func collectionCellConfigure(indexNum:Int){
        let collecton = collectionConfigure()
        //        cellLabel?.text = String(describing : collecton[indexNum].range)
        
    }
}

