//
//  ReportViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/11/22.
//

import UIKit

class ReportViewController: UIViewController {
    @IBOutlet weak var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoView.image = UIImage(named: "logo.png")
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
