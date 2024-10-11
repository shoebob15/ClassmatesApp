//
//  ViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/2/24.
//

import UIKit

class AppData {
    static var students = [
        Student(name: "Cam", nickname: "Chef Cam", smartness: .tardy),
        Student(name: "Ryan", nickname: "Rat Ryan", smartness: .absent),
        Student(name: "Ava", nickname: "No Pickle Noftz", smartness: .present),
        Student(name: "Ava", nickname: "ABBA Ava", smartness: .present),
        Student(name: "Evan", nickname: "Flutin' Evan", smartness: .tardy),
        Student(name: "Justin", nickname: "Trustin' Justin", smartness: .present),
        Student(name: "Jayden", nickname: "Join Jayden", smartness: .absent)
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

