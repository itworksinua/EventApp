//
//  TableViewCell.swift
//  EventApp
//
//  Created by Admin on 02.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var event: EventModel?
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(model: EventModel) {
        event = model
        date.text = "5"
        month.text = "Jul"
        backgroundImage.image = UIImage.init(named: model.imageName!)
        favoriteImage.image = (model.favorite!) ? UIImage.init(named: "heart_full") : UIImage.init(named: "heart")
        nameLabel.text = model.name!
        addressLabel.text = model.address!
        priceLabel.text = "$" + model.price!
    }
    
}
