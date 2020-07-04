//
//  CategoryViewController.swift
//  EventApp
//
//  Created by Inna Levandovskaya on 05.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    let categories = ["Food", "Adventure", "Social", "For 2", "Sport", "Art"]
    @IBOutlet weak var collecion: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
