//
//  SeeReportsViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 4/14/22.
//

import UIKit
import Firebase

class SeeReportsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchLabel: UILabel!
    let db = Firestore.firestore()

    var reports:[String] = []
    @IBOutlet weak var reportsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reportsTable.delegate = self
        reportsTable.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
        if let searchTextField = self.searchBar.value(forKey: "searchField") as? UITextField , let clearButton = searchTextField.value(forKey: "_clearButton")as? UIButton {

            clearButton.addTarget(self, action: #selector(self.clearSearch), for: .touchUpInside)
        }
        searchLabel.text = "Search Results for: "
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reports = []
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

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchLabel.text = "Search Results for: \(searchBar.text!)"
        db.collection("Reports").getDocuments() { [self] (querySnapshot, err) in
            reports = []

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
                    
                    print(offenderText + "--" + searchBar.text!)
                    offenderText = offenderText.lowercased()
                    countyText = countyText.lowercased()
                    var searchBarText = searchBar.text!.lowercased()
                    if(offenderText.contains(searchBarText) || searchBarText.contains(offenderText)){
                        self.reports.append(finalText)
                        print(self.reports)
                    } else if(countyText.contains(searchBarText) || searchBarText.contains(countyText)){
                        self.reports.append(finalText)
                        print(self.reports)
                    }
                }
            }
            DispatchQueue.main.async { self.reportsTable.reloadData() }

        }
    }
    @objc func clearSearch() {
        print("cancel")
        searchLabel.text = "Search Results for: "

        db.collection("Reports").getDocuments() { [self] (querySnapshot, err) in
            reports = []

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

                }
            }
            DispatchQueue.main.async { self.reportsTable.reloadData() }

        }
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
