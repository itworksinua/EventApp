//
//  EventViewController.swift
//  EventApp
//
//  Created by Inna Levandovskaya on 05.07.2020.
//  Copyright © 2020 ItWorksinUA. All rights reserved.
//

import UIKit
import EventKit

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

    var model: EventModel?
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
        
        imgAuthor.layer.borderWidth = 1
        imgAuthor.layer.borderColor = UIColor.init(named: "ColorMain")?.cgColor
        
        viewActions.layer.shadowColor = UIColor.black.cgColor
        viewActions.layer.shadowOpacity = 0.05
        viewActions.layer.shadowOffset = CGSize(width: 0, height: -2)
        viewActions.layer.shadowRadius = 2
        
        guard let model = model else {
            return
        }
        imgCover.image = UIImage.init(named: model.imageName!)
        labelTitle.text = model.name!
        labelPrice.text = model.price!
        labelLocation.text = model.address!
        btnLike.setImage((model.favorite!) ? UIImage.init(named: "icon_like_on") : UIImage.init(named: "icon_like_off") ,for: .normal)
    }
    
    //MARK: Actions
    
    @objc func onShare() {
        let items = ["This app is my favorite"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
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
        let eventStore : EKEventStore = EKEventStore()

//        model = EventModel.init(id: 1)
//        model?.name = "Test"
//        model?.address = "Test adr"
        guard let model = model else {
            return
        }

        eventStore.requestAccess(to: .event) { (granted, error) in

            if (granted) && (error == nil) {
                print("granted \(granted)")
                print("error \(error)")

                let event:EKEvent = EKEvent(eventStore: eventStore)

                event.title = model.name
                event.startDate = Date()
                event.endDate = Date()
                event.notes = model.address
                event.isAllDay = true
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }
                print("Saved Event")
            }
            else{

                print("failed to save event with error : \(error) or access not granted")
            }
        }
    }
    
    @IBAction func onSentInvitation(_ sender: Any) {
        
    }

}
