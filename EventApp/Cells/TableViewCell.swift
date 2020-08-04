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
    @IBOutlet weak var favoriteImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bckgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bckgView.layer.borderWidth = 1
        bckgView.layer.borderColor = UIColor.init(named: "ColorBorder")?.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(model: EventModel) {
        event = model
        date.text = "27"
        month.text = "Jul"
        backgroundImage.image = UIImage.init(named: model.imageName!)
        favoriteImage.setImage((model.favorite!) ? UIImage.init(named: "icon_like_on") : UIImage.init(named: "icon_like_off") ,for: .normal)
        nameLabel.text = model.name!
        addressLabel.text = model.address!
        priceLabel.text = model.price!
    }
    
}
