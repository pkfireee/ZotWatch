//
//  CourseSearchViewController.swift
//  GroupProject
//
//  Created by Garry Fanata on 6/6/19.
//  Copyright © 2019 Kinaar Desai. All rights reserved.
//

import UIKit

class CourseSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet var deptPicker: UIPickerView!
    @IBOutlet var yearPicker: UIPickerView!
    @IBOutlet var quarterPicker: UIPickerView!

    @IBOutlet var findCoursesButton: UIButton!
    
    var courseDict: [String:String] = [
        "dept" : "Default Dept",
        "year" : "Default Year",
        "quarter" : "Default Quarter"
    ]
    
    let depts = ["AC ENG","AFAM","ANATOMY","ANTHRO","ARABIC","ARMN","ART","ART HIS","ARTS","ASIANAM","BIOCHEM","BIO SCI","BATS","BME","BSEMD","BANA","CBEMS","ENGRMSE","CHEM","CHC/LAT","CHINESE","ENGRCEE","CLASSIC","COGS","COM LIT","CSE","COMPSCI","CRM/LAW","CRITISM","CLY&THY","DANCE","DEV BIO","DRAMA","EARTHSS","E ASIAN","ECO EVO","ECON","EDUC","EECS","ECPS","ENGR","ENGLISH","EPIDEM","EURO ST","MGMT EP","FLM&MDA","FIN","FRENCH","MGMT FE","GEN&SEX","GERMAN","GLBCLT","GLBL ME","GREEK","MGMT HC","HEBREW","HISTORY","HUMAN","IN4MATX","I&C SCI","INTL ST","ITALIAN","JAPANESE","KOREAN","LATIN","LINGUIS","LIT JRN","LPS","MGMTMBA","MGMT","MGMTPHD","MPAC","MATH","ENGRMAE","PHARM","M&MG","MOL BIO","MUSIC","NET SYS","NEURBIO","NUR SCI","PATH","PED GEN","PERSIAN","PHRMSCI","PHILOS","PHY SCI","PHYSICS","PHYSIO","PP&D","POL SCI","PORTUG","PSY BEH","PSYCH","PUBHLTH","PUB POL","REL STD","ROTC","RUSSIAN","SOCECOL","SPPS","SOC SCI","SOCIOL","SPANISH","STATS","TOX","UCDC","UNI AFF","UNI STU","UPPP","VIETMSE","VIS STD","WRITING"]
    
    let quarters = ["Fall","Winter","Spring","Summer 1","Summer 10-wk","Summer (COM)","Summer 2"]
    let quarterCodes = ["92","03","14","25","39","51","76"]
    
    let years = ["2019","2018","2017","2016","2015","2014"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.deptPicker.delegate = self
        self.deptPicker.dataSource = self
        self.yearPicker.delegate = self
        self.yearPicker.dataSource = self
        self.quarterPicker.dataSource = self
        self.quarterPicker.delegate = self
        // Do any additional setup after loading the view.
        print(isKeyPresentInUserDefaults(key: "courses"))
        
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return depts.count
        } else if pickerView.tag == 2 {
            return years.count
        } else if pickerView.tag == 3{
            return quarters.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            courseDict["dept"] = depts[row]
            return depts[row]
        } else if pickerView.tag == 2 {
            courseDict["year"] = years[row]
            return years[row]
        } else if pickerView.tag == 3{
            courseDict["quarter"] = quarterCodes[row]
            return quarterCodes[row]
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            courseDict["dept"] = depts[row]
        } else if pickerView.tag == 2 {
            courseDict["year"] = years[row]
        } else if pickerView.tag == 3{
            courseDict["quarter"] = quarterCodes[row]
        } else {
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "course2section" {
            let sectionTVC = segue.destination as! SectionTableViewController
            sectionTVC.coursesDict = self.courseDict
        }
    }
    
    @IBAction func findCoursesButton(_ sender: Any) {
        print(self.courseDict)
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
