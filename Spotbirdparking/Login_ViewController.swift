//
//  Login_ViewController.swift
//  Spotbirdparking
//
//  Created by mac on 01/10/18.
//  Copyright © 2018 Spotbird. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Login_ViewController: UIViewController {
    
    @IBOutlet weak var txt_uname: UITextField!
    @IBOutlet weak var txt_pass: UITextField!
    
    var refArtists: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_uname.autocorrectionType  = .no
        txt_pass.autocorrectionType = .no
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btn_newuser(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Signup_ViewController") as! Signup_ViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btn_login(_ sender: Any) {
    
<<<<<<< HEAD
    Spinner.start()
=======
      Spinner.start()
>>>>>>> f8def7c2def06cc437860ffbb11e730b37e99419
     let ref = Database.database().reference().child("User").queryOrdered(byChild: "uname").queryEqual(toValue : txt_uname.text!)
        ref.observe(.value, with:{ (snapshot: DataSnapshot) in
            
            if snapshot.exists()  {
                
                for snap in snapshot.children {
                    
                    let dict = ((snap as! DataSnapshot).value) as! NSDictionary
                    print(dict)
                    if self.txt_pass.text! == dict.value(forKey: "pass") as! String {
                        //self.id =  ((snap as! DataSnapshot).key)
                        AppState.sharedInstance.userid = dict.value(forKey: "id") as! String
                        UserDefaults.standard.setValue(dict, forKey: "logindata")
                        UserDefaults.standard.synchronize()
                        //                        let alertController = UIAlertController(title: "Right", message: "success", preferredStyle: .alert)
                        //
                        //                        //let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        //                        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        //                            UIAlertAction in
                           Spinner.stop()
                        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                        
                        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "myTabbarControllerID")
                        appDelegate.window?.rootViewController = initialViewController
                        appDelegate.window?.makeKeyAndVisible()
                        //                        }
                        //                        alertController.addAction(defaultAction)
                        //
                        //                        self.present(alertController, animated: true, completion: nil)
                        
                    }else {
                          Spinner.stop()
                        let alertController = UIAlertController(title: "Error", message: "Incorrect Password..", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                }
<<<<<<< HEAD
            }else{
                     Spinner.stop()
                let alertController = UIAlertController(title: "Error", message: "Incorrect UserName..", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
=======
>>>>>>> f8def7c2def06cc437860ffbb11e730b37e99419
            }
           
        })
     }
    
    
}
