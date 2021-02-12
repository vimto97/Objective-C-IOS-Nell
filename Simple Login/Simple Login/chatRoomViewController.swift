//
//  chatRoomViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 28/03/2020.
//

import UIKit
import FirebaseDatabase

class chatRoomViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var mychatArray=[String]()
    var recchatArray=[String]()
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func Send(_ sender: Any) {
        self.recchatArray.removeAll()
        var chat = textField.text!
        //mychatArray.append(chat)
        textField.text = ""
        ref.child("chatRoom").childByAutoId().setValue(chat)
        getData()
    }
    
    func getData() {
        ref.child("chatRoom").observe(DataEventType.childAdded, with: { (snapshot) in
        let data1 = snapshot.value as! String
            self.recchatArray.append(data1)
            self.myTable.reloadData()
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return ask1.count
        return recchatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
        cell.textLabel?.text = recchatArray[indexPath.row]
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

}
