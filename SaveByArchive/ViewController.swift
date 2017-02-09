//
//  ViewController.swift
//  SaveByArchive
//
//  Created by Apple on 2/6/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import os.log
import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var familyNameTextField: UITextField!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    var persons = [Person]()

    @IBAction func SaveButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private methods
    
    private func savePersons() {
        let saveIsSuccessfull = NSKeyedArchiver.archiveRootObject(persons, toFile: Person.ArchiveURL.path)
        
        if saveIsSuccessfull{
            os_log("person is saved sucessfully", log: OSLog.default, type: .debug)
        }else {
            os_log("failed to save person", log: OSLog.default, type: .debug)
        }
        
    }


}

