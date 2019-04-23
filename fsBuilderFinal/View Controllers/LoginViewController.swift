//
//  cViewController.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//
import Firebase
import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: Any) {
        
        guard emailField.text != "", pwField.text != "" else {return}
        
        Auth.auth().signIn(withEmail: emailField.text!, password: pwField.text!, completion: { (user, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            
            if let user = user {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")
                
                self.present(vc, animated: true, completion: nil)
            }
        })
        
        
    }
    
    
}
