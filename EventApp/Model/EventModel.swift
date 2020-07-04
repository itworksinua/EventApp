//
//  EventModel.swift
//  EventApp
//
//  Created by Admin on 03.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class EventModel {
    var id: Double
    var name: String?
    var date: Date?
    var favorite: Bool?
    var address: String?
    var price: String?
    var imageName: String?
    
    init(id: Double) {
        self.id = id
    }
}
