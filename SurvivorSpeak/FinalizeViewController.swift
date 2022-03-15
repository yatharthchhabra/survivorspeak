//
//  FinalizeViewController.swift
//  SurvivorSpeak
//
//  Created by Siddharth Pillai on 3/14/22.
//
import UIKit

class FinalizeViewController: UIViewController
    {

    @IBOutlet weak var QLabel: UILabel!
    
    
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var SummaryLabel: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        QLabel.text = "Last step " + defaults.string(forKey: "Name")! + ", does this look correct?"
        
        let dateText = defaults.string(forKey: "Date")!
        let countyText = defaults.string(forKey: "County")!
        let positionText = defaults.string(forKey:"Position")!
        let offenderText = defaults.string(forKey:"Offender")!
        let detailsText = defaults.string(forKey:"Details")!
        
        let firstSection = "On " + dateText + ", in " + countyText + " county, "
        let secondSection = positionText + " " + offenderText + " commited an infraction as described below : "
        SummaryLabel.text =  firstSection + secondSection + detailsText
        self.SummaryLabel.alpha = 0
        self.QLabel.alpha = 0
        self.Okbtn.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.SummaryLabel.alpha = 1.0
            self.QLabel.alpha = 1.0
            self.Okbtn.alpha = 1.0
            }
    }
}
