//
//  FinalizeViewController.swift
//  SurvivorSpeak
//
//  Created by Siddharth Pillai on 3/14/22.
//
import UIKit

class FinalizeViewController: UIViewController
    {
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var SummaryLabel: UITextView!
    var str = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        QLabel.text = "Last step " + defaults.string(forKey: "Name")! + ", does this look correct?"
        let name = defaults.string(forKey: "Name")!
        let phoneNum = defaults.string(forKey: "Phone")!
        let emailAddr = defaults.string(forKey: "Email")!
        let dateText = defaults.string(forKey: "Date")!
        let countyText = defaults.string(forKey: "County")!
        let positionText = defaults.string(forKey:"Position")!
        let offenderText = defaults.string(forKey:"Offender")!
        let detailsText = defaults.string(forKey:"Details")!
        
        let firstSection = "On " + dateText + ", in " + countyText + " county, "
        let secondSection = positionText + " " + offenderText + " commited an infraction as described below : "
        SummaryLabel.text =  firstSection + secondSection + detailsText
        
        let reporterInfo = "Name: " + name + " Contact details: " + phoneNum + " " + emailAddr
        let timeLoc = "Date: " + dateText + " County: " + countyText
        let infract = "Offender: " + positionText + " " + offenderText + " \nOffense: " + detailsText
        
        str = reporterInfo + "\n" + timeLoc + "\n" + infract
        
        self.SummaryLabel.alpha = 0
        self.QLabel.alpha = 0
        self.Okbtn.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    @IBAction func onClick(_ sender: Any) {
        let url = getDocumentsDirectory().appendingPathComponent("report.txt")

        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.SummaryLabel.alpha = 1.0
            self.QLabel.alpha = 1.0
            self.Okbtn.alpha = 1.0
            }
    }
}
