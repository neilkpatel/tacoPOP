//
//  TacoCell.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/31/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit

class TacoCell: UICollectionViewCell, NibLoadableView , Shakeable {

    @IBOutlet weak var tacoImage: UIImageView!
    @IBOutlet weak var tacoLabel: UILabel!
    
    var taco: Taco!
    
    func configurecell(taco: Taco) {
        self.taco = taco
        tacoImage.image = UIImage(named: taco.proteinId.rawValue) //raw value of enum is a string. 
        tacoLabel.text = taco.productName
    }
}

