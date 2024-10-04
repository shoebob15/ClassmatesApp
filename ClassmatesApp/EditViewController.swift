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
        attendanceSegmented.selectedSegmentIndex = AppData.students[AppData.indexToEdit].attendance.rawValue

    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        AppData.students[AppData.indexToEdit] = Student(name: nameTextField.text!, nickname: nicknameTextField.text!, smartness: Attendance(rawValue: attendanceSegmented.selectedSegmentIndex)!)
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func attendanceAction(_ sender: UISegmentedControl) {
    }
    
    @IBAction func keyboardButton(_ sender: UIButton) {
        self.resignFirstResponder()
    }
}
