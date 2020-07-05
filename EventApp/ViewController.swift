//
//  ViewController.swift
//  EventApp
//
//  Created by Admin on 02.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let categories = ["Food", "Adventure", "Social", "For 2", "Sport", "Art"]
    @IBOutlet weak var collecion: UICollectionView!
    @IBOutlet var table: UITableView!
    var dataSource = [EventModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        makeDataSource()
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        if categories.count > indexPath.row {
            cell.title = categories[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categories[indexPath.row]
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)
        ])
        return CGSize(width: itemSize.width + 30.0, height: 40)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        vc.model = dataSource[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
