//
//  Q6ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q6ViewController: UIViewController {
    @IBOutlet weak var answerText: UITextField!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(answerText.text, forKey: "Details")
    }
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0.80, animated: true)
        self.Okbtn.layer.cornerRadius = 15
        self.Okbtn.layer.masksToBounds = true
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
