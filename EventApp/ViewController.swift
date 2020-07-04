//
//  ViewController.swift
//  EventApp
//
//  Created by Admin on 02.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    var dataSource = [EventModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        makeDataSource()
        table.reloadData()
    }

    func makeDataSource() {
        let model1 = EventModel.init(id: 1)
        model1.address = "Alexandria, NSW"
        model1.name = "Cooking Class"
        model1.price = "$12,00"
        model1.imageName = "bkg_1"
        model1.favorite = false
        dataSource.append(model1)
        let model2 = EventModel.init(id: 2)
        model2.address = "Hunter Valley, NSW"
        model2.name = "Wine Tasting"
        model2.price = "Free"
        model2.imageName = "bkg_2"
        model2.favorite = true
        dataSource.append(model2)
        let model3 = EventModel.init(id: 3)
        model3.address = "Hunter Valley, NSW"
        model3.name = "Custom Class"
        model3.price = "$10,00"
        model3.imageName = "bkg_3"
        model3.favorite = false
        dataSource.append(model3)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = table.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        cell.updateUI(model: dataSource[indexPath.row])
        cell.bckgView.layer.cornerRadius = 10
        cell.bckgView.layer.masksToBounds = true
        cell.shadowView.layer.cornerRadius = 10
        cell.shadowView.layer.masksToBounds = true
        return cell
    }
    
    
}
