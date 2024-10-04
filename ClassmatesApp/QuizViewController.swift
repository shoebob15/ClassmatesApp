//
//  QuizViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/4/24.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    var selectedStudent: Student = AppData.students[Int.random(in: 0...AppData.students.count - 1)]
    
    var action: UIAlertAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        action = UIAlertAction(title: "Ok", style: .default)
        
        refresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refresh()
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        if nicknameTextField.text!.lowercased() == selectedStudent.nickname.lowercased() {
            let alert = UIAlertController(title: "Nice Job!", message: "You got it right!", preferredStyle: .alert)
            
            alert.addAction(action!)
            
            present(alert, animated: true) {
                self.refresh()
            }
        } else {
            let alert = UIAlertController(title: "Not great", message: "You got it wrong", preferredStyle: .alert)
            
            alert.addAction(action!)
            
            present(alert, animated: true) {
                self.refresh()
            }
            
        }
        

    }
    
    @IBAction func skipAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Skipped", message: "The answer was \(selectedStudent.nickname)!", preferredStyle: .alert)
        
        alert.addAction(action!)
        
        present(alert, animated: true) {
            self.refresh()
        }
    }
    
    func refresh() {
        var previous = selectedStudent
        
        repeat {
            previous = selectedStudent
            self.selectedStudent = AppData.students[Int.random(in: 0...AppData.students.count - 1)]
        } while selectedStudent.name != previous.name
        
        
        self.nameLabel.text = "Name: \(self.selectedStudent.name)"
        
        self.nicknameTextField.text = ""
    }
}
