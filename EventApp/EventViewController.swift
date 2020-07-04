//
//  EventViewController.swift
//  EventApp
//
//  Created by Inna Levandovskaya on 05.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var viewActions: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    func setupUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let btnShare: UIButton = UIButton(type: .custom)
        btnShare.setImage(UIImage(named: "icon_share"), for: .normal)
        btnShare.addTarget(self, action: #selector(onShare), for: .touchUpInside)
        btnShare.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnShare)
        
        let btnBack: UIButton = UIButton(type: .custom)
        btnBack.setImage(UIImage(named: "icon_back"), for: .normal)
        btnBack.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        btnBack.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnBack)
        
        imgAuthor.layer.borderWidth = 1
        imgAuthor.layer.borderColor = UIColor.init(named: "ColorMain")?.cgColor
        
        viewActions.layer.shadowColor = UIColor.black.cgColor
        viewActions.layer.shadowOpacity = 0.05
        viewActions.layer.shadowOffset = CGSize(width: 0, height: -2)
        viewActions.layer.shadowRadius = 2
    }
    
    //MARK: Actions
    
    @objc func onShare() {
        let items = ["This app is my favorite"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @objc func onBack() {
        
    }
    
    @IBAction func onLike(_ sender: Any) {
        if btnLike.isSelected {
            btnLike.isSelected = false
            btnLike.setImage(UIImage.init(named:"icon_like_off"), for: .normal)
        } else {
            btnLike.isSelected = true
            btnLike.setImage(UIImage.init(named:"icon_like_on"), for: .normal)
        }
    }
    
    @IBAction func onAttend(_ sender: Any) {
        
    }
    
    @IBAction func onAddToCalendar(_ sender: Any) {
        
    }
    
    @IBAction func onSentInvitation(_ sender: Any) {
        
    }

}
