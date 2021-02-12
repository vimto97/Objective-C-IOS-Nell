//
//  mcqViewController.swift
//  Simple Login
//
//  Created by Solanki, Vimal on 13/03/2020.
//

import UIKit
import FirebaseDatabase
let ref = Database.database().reference()
var rightAnswer = 0
var wrongAnswer = 0

class mcqViewController: UIViewController {
    var answerOfQuestion = ""
    var answer1 = ""
    var answer2 = ""
    var answer3 = ""
    var answer4 = ""
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    
    @IBOutlet weak var labelB: UILabel!
    
    @IBOutlet weak var labelC: UILabel!
    
    @IBOutlet weak var labelD: UILabel!
    

    
    struct questionStruct: Decodable {
        let question : String?
        let options : answer
        let answer : String?

    }
    
    struct answer: Decodable {
        let A : String?
        let B : String?
        let C : String?
        let D : String?
    }
    var questionArray1 = [String]()
    var answer = ""
    
    func decodeJSON(){
        
        guard let path = Bundle.main.path(forResource: "\(module)", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data.init(contentsOf: url)

            
            let question = try JSONDecoder().decode(questionStruct.self, from: data)
            self.questionLabel.text = question.question
            self.labelA.text = question.options.A
            self.labelB.text = question.options.B
            self.labelC.text = question.options.C
            self.labelD.text = question.options.D
            
            //var answer = question.answer
            //print(answer!)
            answerOfQuestion = question.answer!
            answer1 = question.options.A!
            answer2 = question.options.B!
            answer3 = question.options.C!
            answer4 = question.options.D!
        } catch {
            print("Error: ",error)
        }
        
        
    }
    
    @IBAction func ALabel(_ sender: Any) {
        if answerOfQuestion == answer1{
                    createalert(title: "Well Done", message: "Correct answer")
                    ref.child("answersid/right").setValue(rightAnswer+10)
        } else{
            //wrongAnswer += 1
            createalert(title: "Sorry", message: "Wrong answer")
            ref.child("answersid/wrong").setValue(wrongAnswer+10)
        }
    }
    
    @IBAction func BLabel(_ sender: Any) {
        if answerOfQuestion == answer2{
                    createalert(title: "Well Done", message: "Correct answer")
                            ref.child("answersid/right").setValue(rightAnswer+10)
                } else{
            
            createalert(title: "Sorry", message: "Wrong answer")
            ref.child("answersid/wrong").setValue(wrongAnswer+10)
                }
            }
    
    @IBAction func CLabel(_ sender: Any) {
        if answerOfQuestion == answer3{
                    createalert(title: "Well Done", message: "Correct answer")
                            ref.child("answersid/right").setValue(rightAnswer+10)
                } else{
            
            createalert(title: "Sorry", message: "Wrong answer")
            ref.child("answersid/wrong").setValue(wrongAnswer+10)
                }
            }
    
    @IBAction func DLabel(_ sender: Any) {
        if answerOfQuestion == answer4{
        createalert(title: "Well Done", message: "Correct answer")
            ref.child("answersid/right").setValue(rightAnswer+10)
                            
                } else{
            wrongAnswer += 1
            createalert(title: "Sorry", message: "Wrong answer")
            ref.child("answersid/wrong").setValue(wrongAnswer+10)
                }
            }
    
        
        
        func createalert(title:String, message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                
                self.performSegue(withIdentifier: "backStudent", sender: nil)
                alert.dismiss(animated: true, completion: nil)
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        decodeJSON()
        
    }
        
        
    

}
