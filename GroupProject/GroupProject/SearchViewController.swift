//
//  SearchViewController.swift
//  GroupProject
//
//  Created by Atef Kai Benothman on 6/4/19.
//  Copyright © 2019 Kinaar Desai. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, DataEnteredDelegate
{

    @IBOutlet weak var departmentNameTextField: UITextField!
    @IBOutlet weak var courseCodeTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func userDidEnterInformation(info: NSString)
    {
        departmentNameTextField.text = info as String
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "addDept")
        {
            let secondVC:DepartmentsTableViewController = segue.destination as! DepartmentsTableViewController
            
            secondVC.delegate = self
        }
    }
 
    
}
