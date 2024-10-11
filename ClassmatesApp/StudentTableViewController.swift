//
//  StudentTableViewController.swift
//  ClassmatesApp
//
//  Created by BRENNAN REINHARD on 10/10/24.
//

import UIKit

class StudentTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let vc = segue.destination as! AddStudentViewController
            
            vc.delegate = self
        }
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "studentCell") as! StudentCell
        cell.configure(student: AppData.students[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = UIContextualAction(style: .destructive, title: "Delete") { _,_,_  in
            AppData.students.remove(at: indexPath.row)
            
            tableView.reloadData()
            
        }
        
        item.image = UIImage(named: "trash")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [item])
        
        return swipeActions
    }
}

class StudentCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var attendance: UILabel!
    
    func configure(student: Student) {
        name.text = student.name
        nickname.text = student.nickname
        attendance.text = student.attendance.description
    }
    
    
    
}
