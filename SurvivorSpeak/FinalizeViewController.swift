//
//  FinalizeViewController.swift
//  SurvivorSpeak
//
//  Created by Siddharth Pillai on 3/14/22.
//
import UIKit
import Firebase

class FinalizeViewController: UIViewController
    {
    let db = Firestore.firestore()
    var name = ""
    var phoneNum = ""
    var emailAddr = ""
    var dateText = ""
    var countyText = ""
    var positionText = ""
    var offenderText = ""
    var detailsText = ""
    
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
        name = defaults.string(forKey: "Name")!
        phoneNum = defaults.string(forKey: "Phone")!
        emailAddr = defaults.string(forKey: "Email")!
        dateText = defaults.string(forKey: "Date")!
        countyText = defaults.string(forKey: "County")!
        positionText = defaults.string(forKey:"Position")!
        offenderText = defaults.string(forKey:"Offender")!
        detailsText = defaults.string(forKey:"Details")!
        
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
            
                // upload to firebase
            // Add a new document with a generated ID
            var ref: DocumentReference? = nil
            ref = db.collection("Reports").addDocument(data: [
                "county": countyText,
                "date": dateText,
                "details": detailsText,
                "email" : emailAddr,
                "name" : name,
                "offender":offenderText ,
                "phone" : phoneNum,
                "position": positionText,
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
                
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
