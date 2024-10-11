//
//  AddStudentViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/11/24.
//

import UIKit

class AddStudentViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var attendanceSegmented: UISegmentedControl!
    
    var delegate: StudentTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: UIButton) {
        AppData.students.append(Student(
            name: nameTextField.text!,
            nickname: nicknameTextField.text!,
            smartness: Attendance(rawValue: attendanceSegmented.selectedSegmentIndex)!)
        )
        
        delegate!.table.reloadData()
        
        self.presentingViewController?.dismiss(animated: true)
        

    }
    
    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func resignKeyboard(_ sender: UIButton) {
        self.resignFirstResponder()
    }
    

}
