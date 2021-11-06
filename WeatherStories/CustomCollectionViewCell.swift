//
//  CustomCollectionViewCell.swift
//  WeatherStories
//
//  Created by Robin George on 06/11/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var obj = NetworkManager.sharedNetwork.dailyObj
    @IBOutlet weak var humiItyRangeLabel: UILabel!
    
    func collectionCellConfigure(index:Int){
        humiItyRangeLabel.text = "\(obj?[index].humidity ?? 0)"
        humiItyRangeLabel.backgroundColor = .blue
    }
}

