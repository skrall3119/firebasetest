//
//  EditViewController.swift
//  firebasetest
//
//  Created by Alex Janci on 2/18/22.
//

import Foundation
import FirebaseDatabase

class EditViewController: UIViewController{
    
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var recievedObject: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
          bodyTextField.layer.borderWidth = 0.5
        bodyTextField.layer.borderColor = borderColor.cgColor
          bodyTextField.layer.cornerRadius = 5.0
        
        titleLabel.text = recievedObject?.title
        bodyTextField.text = recievedObject?.body
    }
    
}
