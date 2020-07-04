//
//  CategoryCollectionViewCell.swift
//  EventApp
//
//  Created by Inna Levandovskaya on 05.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var btnTitle: UIButton!
    
    var title:String = "" {
        didSet {
            btnTitle.setTitle(title, for: .normal)
        }
    }
    
}
