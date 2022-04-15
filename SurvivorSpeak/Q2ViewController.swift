//
//  Q2ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q2ViewController: UIViewController {
    
    func isValidEmailAddress(emailString: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        do{
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailString as NSString
            let results = regex.matches(in: emailString, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0 {
                returnValue = false
            }
        } catch let error as NSError {
            returnValue = false;
        }
            return returnValue
        }
    
    func isValidPhoneNumber(phone: String) -> Bool {
        var returnValue = true
        let phoneRegEx = "^\\d{9}"
        do{
            let regex = try NSRegularExpression(pattern: phoneRegEx)
            let nsString = phone as NSString
            let results = regex.matches(in: phone, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0 {
                returnValue = false
            }
        } catch let error as NSError {
            returnValue = false;
        }
            return returnValue
        }
    var emailDialogMessage = UIAlertController(title:"Error", message: "Invalid Email Address", preferredStyle: .alert
    )
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
      })
    var phoneDialogMessage = UIAlertController(title:"Error", message: "Invalid Phone Number", preferredStyle: .alert
    )
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if (emailText.text == ""){
            defaults.set("anonymous", forKey: "Email")
        } else
        if(!isValidEmailAddress(emailString: emailText.text!)) {
            self.present(emailDialogMessage, animated: true, completion: nil)
        }
        else {
            defaults.set(emailText.text, forKey: "Email")
        }
        if (phoneText.text == ""){
            defaults.set("000-000-0000", forKey: "Phone")
        } else
            if(!isValidPhoneNumber(phone: phoneText.text!)) {
                self.present(phoneDialogMessage,animated: true,completion: nil)
            }
        else {
            defaults.set(phoneText.text, forKey: "Phone")
        }
        
    }
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var EmailLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let gesture = UITapGestureRecognizer(target:self, action: #selector(onClickView))
        //self.view.addGestureRecognizer(gesture)
        
        progressBar.setProgress(0.14, animated: true)
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
        emailDialogMessage.addAction(ok)
        phoneDialogMessage.addAction(ok)
        self.NameLabel.alpha = 0
        self.EmailLable.alpha = 0
        self.PhoneLabel.alpha = 0
        self.emailText.alpha = 0
        self.phoneText.alpha = 0
        self.Okbtn.alpha = 0
        NameLabel.text = "Hi " + UserDefaults.standard.string(forKey: "Name")! + ", we're here to help. What's the best way to contact you?"
    
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.NameLabel.alpha = 1.0
            self.EmailLable.alpha = 1.0
            self.PhoneLabel.alpha = 1.0
            self.emailText.alpha = 1.0
            self.phoneText.alpha = 1.0
            self.Okbtn.alpha = 1.0
            }
    }
    
    


    @IBOutlet weak var progressBar: UIProgressView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
