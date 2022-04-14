//
//  SeeReportsViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 4/14/22.
//

import UIKit
import Firebase

class SeeReportsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let db = Firestore.firestore()

    var reports:[String] = []
    @IBOutlet weak var reportsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reportsTable.delegate = self
        reportsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        db.collection("Reports").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var data = document.data()
                    
                    var name = data["name"] as! String
                    var phoneNum = data["phone"] as! String
                    var emailAddr = data["email"] as! String
                    var dateText = data["date"] as! String
                    var countyText = data["county"] as! String
                    var positionText = data["position"] as! String
                    var offenderText = data["offender"] as! String
                    var detailsText = data["details"] as! String
                    
                    let firstSection = "On " + dateText + ", in " + countyText + " county, "
                    let secondSection = positionText + " " + offenderText + " commited an infraction as described below : "
                    var finalText =  firstSection + secondSection + detailsText
                    self.reports.append(finalText)
                    DispatchQueue.main.async { self.reportsTable.reloadData() }
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "reportid", for: indexPath)
          var content = cell.defaultContentConfiguration()
          content.text = reports[indexPath.row]
          cell.contentConfiguration = content
          return cell
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
