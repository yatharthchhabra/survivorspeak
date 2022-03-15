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

    @IBOutlet weak var PowerPosLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!

    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var positions = ["Police Officer", "Attorney", "Prosecutor","Judge", "Correctional Facility Officer", "Unknown"]
    @IBOutlet weak var offenderText: UITextField!
    @IBOutlet weak var positionsPicker: UIPickerView!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(offenderText.text, forKey: "Offender")
        defaults.set(pickedPosition, forKey: "Position")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.questionLabel.alpha = 1.0
            self.Okbtn.alpha = 1.0
            self.offenderText.alpha = 1.0
            self.positionsPicker.alpha = 1.0
            self.PowerPosLabel.alpha = 1.0

            }
    }
    
    @IBOutlet weak var Okbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        progressBar.setProgress(0.28, animated: true)
        self.positionsPicker.delegate = self
        self.positionsPicker.dataSource = self
        let tempname = defaults.string(forKey: "Name")
        self.questionLabel.text = "Ok " + tempname! + ", who's this report about?"
        let view = self.Okbtn
        let shadowLayer = CAShapeLayer()
        view!.layer.cornerRadius = 20
        shadowLayer.path = UIBezierPath(roundedRect: view!.bounds,
                                            cornerRadius: view!.layer.cornerRadius).cgPath
        shadowLayer.fillColor = view!.backgroundColor?.cgColor
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.6
        shadowLayer.shadowRadius = 5.0
        view!.layer.insertSublayer(shadowLayer, at: 0)
        self.questionLabel.alpha = 0
        self.Okbtn.alpha = 0
        self.offenderText.alpha = 0
        self.positionsPicker.alpha = 0
        self.PowerPosLabel.alpha = 0
        
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
