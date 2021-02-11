//
//  mcqViewController.swift
//  Simple Login
//
//  Created by Solanki, Vimal on 13/03/2020.
//

import UIKit


class mcqViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    
    @IBOutlet weak var labelB: UILabel!
    
    @IBOutlet weak var labelC: UILabel!
    
    @IBOutlet weak var labelD: UILabel!
    

    
    struct questionStruct: Codable {
        let question : String
        let options : [String]
        let answer : String

    }
    func jasonGet(){
        guard let mainUrl = Bundle.main.url(forResource: "mcq", withExtension: "json") else { return }
                
        do {
            //let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let subUrl = documentDirectory.appendingPathComponent("mcq.json")
            loadFile(mainPath: mainUrl, subPath: subUrl)
            print(loadFile)
        } catch {
            print(error)
        }
        
    }

    
    override func viewDidLoad() {

        super.viewDidLoad()

    }
    

}
