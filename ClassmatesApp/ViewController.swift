//
//  ViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/2/24.
//

import UIKit

class AppData {
    static var students = [
        Student(name: "Billy", nickname: "Bill", smartness: .tardy),
        Student(name: "Bobby", nickname: "Bob", smartness: .absent),
        Student(name: "Brian", nickname: "Ian", smartness: .present),
        Student(name: "Brianna", nickname: "Bri", smartness: .present),
        Student(name: "Brooklyn", nickname: "Brooke", smartness: .tardy)
    ]
    
    static var indexToEdit = 0
}

enum Attendance: Int, CustomStringConvertible {
    var description: String {
        switch self {
        case .absent: return "Present"
        case .tardy: return "Tardy"
        case .present: return "Absent"
        }
    }
    
    case present = 2, tardy = 1, absent = 0
}

class Student {
    let name: String
    let nickname: String
    let attendance: Attendance
    
    init(name: String, nickname: String, smartness: Attendance) {
        self.name = name
        self.nickname = nickname
        self.attendance = smartness
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

