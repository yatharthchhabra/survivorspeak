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
    
    
    @IBOutlet weak var SummaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        QLabel.text = "Last step " + defaults.string(forKey: "Name")! + ", does this look correct"
        
        let dateText = defaults.string(forKey: "Date")!
        let countyText = defaults.string(forKey: "County")!
        let positionText = defaults.string(forKey:"Position")
        let offenderText = defaults.string(forKey:"Offender")
        let detailsText = defaults.string(forKey:"Details")
        
        
        SummaryLabel.text = "On " + dateText + ", in" + countyText + " county, "  + positionText + " " + offenderText + " commited an infraction as described below : " + detailsText
        
        // Do any additional setup after loading the view.
    }
}
