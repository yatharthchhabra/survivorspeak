//
//  ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q1ViewController: UIViewController {
    let data = UserDefaults.standard
    var dialogMessage = UIAlertController(title:"Empty", message: "Name can not be left empty!", preferredStyle: .alert
    )
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
      })
    
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var answer: UITextField!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if (answer.text == "") {
            self.present(dialogMessage, animated:true, completion:nil)
        } else {
            defaults.set(answer.text, forKey: "Name")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0, animated: true)
        self.Okbtn.layer.cornerRadius = 15
        self.Okbtn.layer.masksToBounds = true
        dialogMessage.addAction(ok)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var progressBar: UIProgressView!
    
    
}

