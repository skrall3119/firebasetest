//
//  ViewController.swift
//  firebasetest
//
//  Created by Alex Janci on 2/17/22.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [Note] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        retrieveData{[weak self] isSuccess in
            self?.tableView.reloadData()
        }
        

    }
    func retrieveData(completion: @escaping (Bool)->Void){
        let ref = Database.database().reference(withPath: "notes")
        ref.observe(.childAdded) {[weak self] (snapshot) in
            let key = snapshot.key
            guard let value = snapshot.value as? [String: Any] else {return}
            if let title = value["title"] as? String, let body = value["body"] as? String{
                let note = Note(id: key, title: title, body: body)
                self?.notes.append(note)
                if let row = self?.notes.count {
                    let indexPath = IndexPath(row: row-1, section: 0)
                    self?.tableView.insertRows(at: [indexPath], with: .automatic)
                }
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        let noteObj = notes[indexPath.row]
        cell.textLabel?.text = noteObj.title
        
        return cell
        
    }
}

struct Note: Codable{
    var id: String
    var title: String
    var body: String
}

