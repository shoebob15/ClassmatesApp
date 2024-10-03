//
//  EditViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/3/24.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var attendanceSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = AppData.students[AppData.indexToEdit].name
        nicknameTextField.text = AppData.students[AppData.indexToEdit].nickname
        attendanceSegmented.selectedSegmentIndex = AppData.students[AppData.indexToEdit].smartness.rawValue

    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
    }
    
    @IBAction func attendanceAction(_ sender: UISegmentedControl) {
    }
    
    @IBAction func keyboardButton(_ sender: UIButton) {
        self.resignFirstResponder()
    }
}
