//
//  NewNoteViewController.swift
//  firebasetest
//
//  Created by Alex Janci on 2/18/22.
//

import Foundation
import FirebaseDatabase
import CloudKit

class NewNoteViewController: UIViewController{
    
    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
          bodyTextField.layer.borderWidth = 0.5
        bodyTextField.layer.borderColor = borderColor.cgColor
          bodyTextField.layer.cornerRadius = 5.0
    }
    @IBAction func saveNote(_ sender: Any) {
        let ref = Database.database().reference(withPath: "notes")
        
        if(titleTextView.text == ""){
            let alert = UIAlertController(title: "Empty Field", message: "Title Cannot be Empty!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            let item = ["title": titleTextView.text, "body": bodyTextField.text]
            ref.childByAutoId().setValue(item)
        }
    }
}
