//
//  ViewController.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var comPwField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    
    let picker = UIImagePickerController()
    var userStorage: StorageReference!
//    let userID = Auth.auth().currentUser!.uid
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userID = Auth.auth().currentUser?.uid {
            print("UserID: \(userID)")
            return
        }
        picker.delegate = self
        nextBtn.isHidden = false
        let storage = Storage.storage().reference(forURL: "gs://todfsbuilder.appspot.com/")
        
        ref = Database.database().reference()
        userStorage = storage.child("users")
        
    }
    
    
    @IBAction func selectImagePressed(_ sender: Any) {
        
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.picker, animated: true, completion: nil)
        }
    }
    
    
   
    let image = UIImage()
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
            nextBtn.isHidden = false
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        guard nameField.text != "", emailField.text != "", password.text != "", comPwField.text != "" else { return}
        
        if password.text == comPwField.text {
            Auth.auth().createUser(withEmail: emailField.text!, password: password.text!, completion: { (user, error) in
                
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let user = user {
                    
                    let changeRequest = Auth.auth().currentUser!.createProfileChangeRequest()
                    changeRequest.displayName = self.nameField.text!
                    changeRequest.commitChanges(completion: nil)
                    
  //                  let imageRef = self.userStorage.child("\(user.user.uid).jpg")
  //                  let data = self.image.jpegData(compressionQuality: 0.50)
                    
                    //This code is copied from uploadTask block. Remove When code fixed
                    
                    if true {

                        let userInfo: [String : Any] = ["uid" : user.user.uid,
                                                        "full name" : self.nameField.text!,
                                                        "urlToImage" : ""]

                        self.ref.child("users").child(user.user.uid).setValue(userInfo)


                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")

                        self.present(vc, animated: true, completion: nil)

                    }
                    
//                    let uploadTask = imageRef.putData(data!, metadata: nil, completion: { (metadata, err) in
//                        if err != nil {
//                            print(err!.localizedDescription)
//                        }
//
//                        imageRef.downloadURL(completion: { (url, er) in
//                            if er != nil {
//                                print(er!.localizedDescription)
//                            }
//                            
//                            
//                            if let url = url {
//
//                                let userInfo: [String : Any] = ["uid" : user.user.uid,
//                                                                "full name" : self.nameField.text!,
//                                                                "urlToImage" : url.absoluteString]
//
//                                self.ref.child("users").child(user.user.uid).setValue(userInfo)
//
//                                
//                                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")
//
//                                self.present(vc, animated: true, completion: nil)
//                                
//                            }
//                            
//                        })
//
//                    })
                    
            //        uploadTask.resume()
                    
                }
                
                
            })
            
            
            
        } else {
            print("Password does not match")
        }
        
        
        
        
        
        
        
        
        
    }
    
}
