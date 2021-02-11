
//
//  ViewfilestudentViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 08/03/2020.
//

import UIKit
import Foundation
var questionArray = [String]()
let startWordsURL = Bundle.main.url(forResource: "file", withExtension: "txt")



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
    

    override func viewDidLoad() {
        //if (startWordsURL != nil) {
        
        if let startWords = try? String(contentsOf: startWordsURL!) {
                
                questionArray = startWords.components(separatedBy: "\n")
                print(questionArray)
            }
        //}
        if questionArray.isEmpty {
            questionArray = ["No questions!"]
        }

        super.viewDidLoad()
        myTable.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let startWords = try? String(contentsOf: startWordsURL!) {
                
                questionArray = startWords.components(separatedBy: "\n")
            }
        //}
        if questionArray.isEmpty {
            questionArray = ["No questions!"]
        }
        myTable.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
