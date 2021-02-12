//
//  lookanswersStaffViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 07/03/2020.
//

import UIKit

class lookanswersStaffViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ask2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell1")
        cell.textLabel?.text = ask2[indexPath.row]
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.reloadData()
        // Do any additional setup after loading the view.
    }
    

}
