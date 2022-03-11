//
//  Q4ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q4ViewController: UIViewController {
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        var date = datePicker.date
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM d, y"
        var dateString = dateFormatter.string(from: date)
        let defaults = UserDefaults.standard
        defaults.set(dateString, forKey: "Date")
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
