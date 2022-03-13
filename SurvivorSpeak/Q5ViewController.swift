//
//  Q5ViewController.swift
//  SurvivorSpeak
//
//  Created by Yatharth Chhabra on 3/10/22.
//

import UIKit

class Q5ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickedCounty = ""

    @IBAction func okClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(pickedCounty, forKey: "County")
    }
    
    @IBOutlet weak var countyPicker: UIPickerView!
    
    var counties =  ["Alcona","Alger","Allegan","Alpena","Antrim","Arenac","Baraga","Barry","Bay","Benzie","Berrien","Branch","Calhoun","Cass","Charlevoix","Cheboygan","Chippewa","Clare","Clinton","Crawford","Delta","Dickinson","Eaton","Emmet","Genesee","Gladwin","Gogebic","Grand Traverse","Gratiot","Hillsdale","Houghton","Huron","Ingham","Ionia","Iosco","Iron","Isabella","Jackson","Kalamazoo","Kalkaska","Kent","Keweenaw","Lake","Lapeer","Leelanau","Lenawee","Livingston","Luce","Mackinac","Macomb","Manistee","Marquette","Mason","Mecosta","Menominee","Midland","Missaukee","Monroe","Montcalm","Montmorency","Muskegon","Newaygo","Oakland","Oceana","Ogemaw","Ontonagon","Osceola","Oscoda","Otsego","Ottawa","Presque Isle","Roscommon","Saginaw","Sanilac","Schoolcraft","Shiawassee","St. Clair","St. Joseph","Tuscola","Van Buren","Washtenaw","Wayne","Wexford"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countyPicker.delegate = self
        self.countyPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedCounty = counties[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        counties.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return counties[row]
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
