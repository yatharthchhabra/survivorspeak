//
//  ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q1ViewController: UIViewController {
    let data = UserDefaults.standard

    
    @IBOutlet weak var logoView: UIImageView!
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
      })
    @IBOutlet weak var QLabel: UILabel!
    
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var answer: UITextField!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if (answer.text == "") {
            defaults.set("Anonymous",forKey: "Name")
        } else {
            defaults.set(answer.text, forKey: "Name")
        }
        
    }
    func updateLabel() {
        UIView.animate(withDuration: 0.0, delay:0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {self.QLabel.alpha = 0.0}, completion:{(finished: Bool) -> Void in
            
            self.QLabel.text = "First up, how should we address you? \n (Leave blank if you wish to remain anonymous)"
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations:{ self.QLabel.alpha = 1.0},completion:nil)
        })
        
      
    }
    override func viewDidAppear(_ animated: Bool) {
        self.updateLabel()
        UIView.animate(withDuration: 1.0) {
                self.Okbtn.alpha = 1.0
                self.answer.alpha = 1.0
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0, animated: true)
        let view = self.Okbtn
        let shadowLayer = CAShapeLayer()
        self.Okbtn.alpha = 0.0
        self.answer.alpha = 0.0
        view!.layer.cornerRadius = 20
        shadowLayer.path = UIBezierPath(roundedRect: view!.bounds,
                                            cornerRadius: view!.layer.cornerRadius).cgPath
        shadowLayer.fillColor = view!.backgroundColor?.cgColor
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.6
        shadowLayer.shadowRadius = 5.0
        view!.layer.insertSublayer(shadowLayer, at: 0)

        /*self.Okbtn.layer.cornerRadius = 15
        self.Okbtn.layer.masksToBounds = true
        self.Okbtn.layer.shadowColor = UIColor.darkGray.cgColor
        self.Okbtn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.Okbtn.layer.shadowOpacity = 0.4 */

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var progressBar: UIProgressView!
    
    
}

