//
//  ViewController.swift
//  Simple Login

// 
//

import UIKit
import CoreData
import LocalAuthentication
import FirebaseDatabase
var module = ""
class ViewController: UIViewController {
    
    @IBOutlet weak var staff: UIButton!
    @IBOutlet weak var signuplabel: UILabel!
    
    @IBOutlet weak var GoToHub: UIButton!
   
    @IBOutlet weak var completeLogin: UIButton!
    
    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet var welcomeMessage: UILabel!
    
    
    @IBOutlet var loginBtn: UIButton!
    
    
    @IBOutlet var logoutButton: UIButton!
    
    private var isUnlocked = false
    
    @IBAction func login(_ sender: Any) {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Logins", into: context!) as! Logins
        newUser.username = username.text!
        newUser.password = password.text!
        module = password.text!
        password.resignFirstResponder()
     
        do {
             try context?.save()
             
             print("Saved")
             welcomeMessage.text = "Welcome"
             welcomeMessage.isHidden = false
             logoutButton.isHidden = false
             username.isHidden = true
             password.isHidden = true
             loginBtn.isHidden = true
             signuplabel.isHidden = true
            logo.isHidden = true
            staff.isHidden = true
            GoToHub.isHidden = false
            completeLogin.isHidden = false

             
         } catch {
             print("there was an error")
         }

    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        GoToHub.isHidden = true
        completeLogin.isHidden = true
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Logins")
         
         request.predicate = NSPredicate(format: "username <> %@", "") //look for username=a string, where the string is not empty.
         
         request.returnsObjectsAsFaults = false
         do {
             let results = try context?.fetch(request)
             for object in results! {
                 context?.delete(object as! NSManagedObject)
             }
             do {
                 try context?.save()
                 print("Saved")
                 welcomeMessage.text = "You have logged out"
                 welcomeMessage.isHidden = false
                 logoutButton.isHidden = true
                //
                logo.isHidden = false
                 username.isHidden = false
                 password.isHidden = false
                 loginBtn.isHidden = false
                staff.isHidden = false
                signuplabel.isHidden = false
             } catch {
                 print("there was an error")
             }
         } catch {
             print("couldn't fetch results")
         }

    }
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
       var context: NSManagedObjectContext?
    
    
    
    
    override func viewDidLoad() {
        ref.child("answersid/wrong").observe(DataEventType.value, with: { (snapshot) in
          wrongAnswer = snapshot.value as! Int
        })
        ref.child("answersid/right").observe(DataEventType.value, with: { (snapshot) in
          rightAnswer = snapshot.value as! Int
        })
        ref.child("questions/Student").child("0").observe(DataEventType.value, with: { (snapshot1) in
        let data1 = snapshot1.value as! String
        ask10.append(data1)
        })
        ref.child("questions/Staff").child("0").observe(DataEventType.value, with: { (snapshot) in
        let data2 = snapshot.value as! String
        ask2.append(data2)
        })
        ref.child("questions/postQ").child("0").observe(DataEventType.value, with: { (snapshot2) in
        let data3 = snapshot2.value as! String
        questionArray.append(data3)
        })
        

        super.viewDidLoad()
        // Do any additional setup after loading the view.
             context = appDelegate.persistentContainer.viewContext
              
              let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Logins")
              
              request.predicate = NSPredicate(format: "username <> %@", "")
              
              request.sortDescriptors?.append(NSSortDescriptor(key: "username", ascending: true))

              request.returnsObjectsAsFaults = false
              welcomeMessage.isHidden = true
              
              do {
                  let results = try context?.fetch(request)
                  
                  if (results?.count)! > 0 { //if there is one...
                      
                      let result = results?[0] as! Logins //was NSManagedObject
                      

                      
                          if let theUsername = result.username {
                            authenticate()
                            //add biometric

                                if self.isUnlocked {
                                    
                                } else {
                                    
                                    //present(homePage(), animated: true, completion: nil)
                                    welcomeMessage.text = "Welcome back, \(theUsername)"
                                    welcomeMessage.isHidden = false
                                   staff.isHidden = true
                                    username.isHidden = true
                                    password.isHidden = true
                                    loginBtn.isHidden = true
                                    logoutButton.isHidden = false
                                    signuplabel.isHidden = true
                                    logo.isHidden = true
                                    GoToHub.isHidden = false
                                    completeLogin.isHidden = false
                                }
                            
                          }
                  } else {
                      print("No results")
                      welcomeMessage.isHidden = true
                      username.isHidden = false
                      password.isHidden = false
                      loginBtn.isHidden = false
                      logoutButton.isHidden = true
                  }
              } catch {
                  print("Couldn't fetch results")
              }
        
        
          }



}

