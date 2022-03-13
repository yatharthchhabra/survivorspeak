//
//  Q3ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickedPosition = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedPosition = positions[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        positions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return positions[row]
    }
    
    var positions = ["Police Officer", "Attorney", "Prosecutor","Judge", "Correctional Facility Officer"]
    @IBOutlet weak var offenderText: UITextField!
    @IBOutlet weak var positionsPicker: UIPickerView!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(offenderText.text, forKey: "Offender")
        defaults.set(pickedPosition, forKey: "Position")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.positionsPicker.delegate = self
        self.positionsPicker.dataSource = self
        
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
