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
        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
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
    var emailDialogMessage = UIAlertController(title:"Empty", message: "Invalid Email Address", preferredStyle: .alert
    )
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
      })
    var phoneDialogMessage = UIAlertController(title:"Empty", message: "Invalid Phone Number", preferredStyle: .alert
    )
    
    
    @IBOutlet weak var Okbtn: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if (emailText.text == ""){
            self.present(emailDialogMessage,animated: true,completion: nil)
        } else
        if(!isValidEmailAddress(emailString: emailText.text!)) {
            self.present(emailDialogMessage, animated: true, completion: nil)
        }
        else {
            defaults.set(emailText.text, forKey: "Email")
        }
        if (phoneText.text == ""){
            self.present(phoneDialogMessage,animated: true,completion: nil)
        } else
            if(!isValidPhoneNumber(phone: phoneText.text!)) {
                self.present(phoneDialogMessage,animated: true,completion: nil)
            }
        else {
            defaults.set(phoneText.text, forKey: "Phone")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0.14, animated: true)
        self.Okbtn.layer.cornerRadius = 15
        self.Okbtn.layer.masksToBounds = true
        emailDialogMessage.addAction(ok)
        phoneDialogMessage.addAction(ok)
        emailText.placeholder = "abc@123.com"
        phoneText.placeholder = "123-456-7890"
        

        // Do any additional setup after loading the view.
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
