//
//  EndViewController.swift
//  SurvivorSpeak
//
//  Created by Siddharth Pillai on 3/15/22.
//

import UIKit

class EndViewController: UIViewController {
  
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var QLabel: UILabel!
    override func viewDidLoad() {
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
        let defaults = UserDefaults.standard
        logoView.image = UIImage(named: "logo.png")
        self.QLabel.text  = "Thank you for your report, " + defaults.string(forKey: "Name")! + ". We are sorry this happened to you. Our team will look into the matter and be in contact."
        self.Okbtn.alpha = 0
        self.QLabel.alpha = 0
        self.logoView.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.QLabel.alpha = 1.0
            self.Okbtn.alpha = 1.0
            self.logoView.alpha = 1.0
            }
    }
}




