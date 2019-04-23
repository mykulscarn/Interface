//
//  dViewController.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit
import Firebase


class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var previewImage: UIImageView!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.previewImage.image = image
            selectBtn.isHidden = true
            postBtn.isHidden = false
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectPressed(_ sender: Any) {
        
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func postPressed(_ sender: Any) {
        AppDelegate.instance().showActivityIndicator()
        
        let uid = Auth.auth().currentUser!.uid
        let ref = Database.database().reference()
        let storage = Storage.storage().reference(forURL: "gs://todfsbuilder.appspot.com/")
        
        let key = ref.child("posts").childByAutoId().key
        let imageRef = storage.child("posts").child(uid).child("\(key).jpg")
    
        let data = UIImageJPEGRepresentation(self.previewImage.image!, 0.6)
        //let data = UIImage(data: imageRef, scale: 0.6)
            //imageRef.jpegData(compressionQuality:0.6)
        
        let uploadTask = imageRef.put(data!, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                AppDelegate.instance().dismissActivityIndicatos()
                return
            }
            
            imageRef.downloadURL(completion: { (url, error) in
                if let url = url {
                    let feed = ["userID" : uid,
                                "pathToImage" : url.absoluteString,
                                "likes" : 0,
                                "author" : FIRAuth.auth()!.currentUser!.displayName!,
                                "postID" : key] as [String : Any]
                    
                    let postFeed = ["\(key)" : feed]
                    
                    ref.child("posts").updateChildValues(postFeed)
                    AppDelegate.instance().dismissActivityIndicatos()
                    
                    self.dismiss(animated: true, completion: nil)
                }
            })
            
        }
        
        uploadTask.resume()
        
    }
    
}
