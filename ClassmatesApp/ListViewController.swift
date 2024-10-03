//
//  ListViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/2/24.
//

import UIKit


enum SortType {
    case name, nickname, attendance
}

class ListViewController: UIViewController {
    var currentIndex = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var sortMenu: UIButton!
    @IBOutlet weak var smartnessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateLabels()
        
        let nameClosure = { (action: UIAction) in
            self.sort(method: .name)
        }
        
        let nicknameClosure = { (action: UIAction) in
            self.sort(method: .nickname)
        }
        
        let attendanceClosure = { (action: UIAction) in
            self.sort(method: .attendance)
        }
                
        sortMenu.menu = UIMenu(children: [
            UIAction(title: "Name", handler: nameClosure),
            UIAction(title: "Nickname", handler: nicknameClosure),
            UIAction(title: "Attendance", handler: attendanceClosure)
            
        ])
        sortMenu.showsMenuAsPrimaryAction = true
    }

    @IBAction func moveLeft(_ sender: UIButton) {
        if currentIndex <= 0 {
            currentIndex = AppData.students.count - 1
        } else {
            currentIndex -= 1
        }
        updateLabels()
        
        AppData.indexToEdit = currentIndex
    }
    
    @IBAction func moveRight(_ sender: UIButton) {
        if currentIndex >= AppData.students.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        updateLabels()
        
        AppData.indexToEdit = currentIndex
    }
    
    func sort(method: SortType) {
        switch method {
        case .name:
            AppData.students.sort(by: {$0.name < $1.name})
            break
        case .nickname:
            AppData.students.sort(by: {$0.nickname < $1.nickname})
            break
        case .attendance:
            AppData.students.sort(by: {$0.smartness.rawValue < $1.smartness.rawValue})
            break
        }
        
        currentIndex = 0
        updateLabels()
        
        AppData.indexToEdit = currentIndex
    }
    
    func updateLabels() {
        nameLabel.text = "Name: \(AppData.students[self.currentIndex].name)"
        
        nicknameLabel.text = "Nickname: \(AppData.students[self.currentIndex].nickname)"
        
        smartnessLabel.text = "Attendance: \(AppData.students[self.currentIndex].smartness.description)"
    }
}
