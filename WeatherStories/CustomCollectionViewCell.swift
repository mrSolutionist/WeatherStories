//
//  CustomCollectionViewCell.swift
//  WeatherStories
//
//  Created by Robin George on 06/11/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let obj = SharedDataManager.sharedNetwork.dailyObj
    @IBOutlet weak var humidityRangeLabel: UILabel!
    
    func collectionCellConfigure(index:Int){
        humidityRangeLabel.text = "\(obj?[index].humidity ?? 0)"
        humidityRangeLabel.backgroundColor = .blue
    }
}

