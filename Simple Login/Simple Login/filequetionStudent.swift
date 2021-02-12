
//
//  ViewfilestudentViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 08/03/2020.
//

import UIKit
import Foundation
import FirebaseDatabase
var questionArray = [String]()


var name = ""

class filequetionStudent: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
        cell.textLabel?.text = questionArray[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "touchfilequestion") as? touchfilequestion
        self.navigationController?.pushViewController(vc!, animated: true)
        name = questionArray[indexPath.row]
    }

    override func viewDidLoad() {

        if questionArray.isEmpty {
            questionArray = ["No questions!"]
        }

        super.viewDidLoad()
        myTable.reloadData()

    }


}
