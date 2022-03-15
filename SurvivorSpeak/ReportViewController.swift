//
//  ReportViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/11/22.
//

import UIKit

class ReportViewController: UIViewController {
    @IBOutlet weak var logoView: UIImageView!

    
    @IBOutlet weak var reportBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoView.image = UIImage(named: "logo.png")
        self.reportBtn.backgroundColor = UIColor.purple
        let view = self.reportBtn
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
        let gesture = UITapGestureRecognizer(target:self, action: #selector(onClickView))
        self.view.addGestureRecognizer(gesture)
        self.reportBtn.alpha = 0.0
        

    }
    @IBOutlet weak var OpeningLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.onBeginView()
    }
    
    var string = """
        Welcome to Survivor Speak
    
        Tap to Continue...
    """
    @objc
    func onClickView(){
        updateLabel()
        UIView.animate(withDuration: 1.0) {
            self.reportBtn.alpha = 1.0
            }
    }
    
    func updateLabel() {
        UIView.animate(withDuration: 0.5, delay:0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {self.OpeningLabel.alpha = 0.0}, completion:{(finished: Bool) -> Void in
            
            self.OpeningLabel.text = "Experienced innapropraite behavior? Tell us more to help attornies build a case."
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations:{ self.OpeningLabel.alpha = 1.0},completion:nil)
        })
    }

    @objc
    func onBeginView() {
        for i in string {
            OpeningLabel.text! += "\(i)"
            RunLoop.current.run(until: Date() + 0.055)
            
        }
        
        
    }
    @IBAction func reportBtnClicked(_ sender: Any) {
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
