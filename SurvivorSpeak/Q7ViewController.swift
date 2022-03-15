//
//  Q7ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q7ViewController: UIViewController {

    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0.94, animated: true)
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
        self.Upload.alpha = 0
        self.QLabel.alpha = 0
        self.Okbtn.alpha = 0
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var Upload: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.Upload.alpha = 1.0
            self.QLabel.alpha = 1.0
            self.Okbtn.alpha = 1.0
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
