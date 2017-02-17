//
//  ChatViewController.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 18/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import Firebase

public enum User: String{

    case me
    case other
    
}

class ChatViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var chatTextFieldBelowSpace: NSLayoutConstraint!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var chatTable: UITableView!
    let identifierOtherCell = "otherCell"
    let identifierMeCell = "meCell"
    let nibMeCell = "MeCell"
    let nibOtherCell = "OtherCell"
    var chatsRef: FIRDatabaseReference!
    var chats = [Chat]()
    
    override func viewDidLoad() {
        self.setupChatTable()
        self.setupFirebase()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = chats[indexPath.row]
        
        switch chat.user! {
        case .me:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierMeCell) as! MeCell
            cell.messageLabel.text = chat.message!
            return cell
        case .other:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierOtherCell) as! OtherCell
            cell.messageLabel.text = chat.message!
            return cell
        }
        
    }
    
    //MARK: TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.chatTextFieldBelowSpace.constant = 230.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.chatTextFieldBelowSpace.constant = 0.0
    }
    
    //MARK: Private Functions
    private func setupChatTable(){
    
        self.chatTable.register(UINib(nibName: nibOtherCell, bundle: nil), forCellReuseIdentifier: identifierOtherCell)
        self.chatTable.register(UINib(nibName: nibMeCell, bundle: nil), forCellReuseIdentifier: identifierMeCell)
        self.chatTable.tableFooterView = UIView()
        
    }
    
    private func setupFirebase() {
        //create a reference to the database
        chatsRef = FIRDatabase.database().reference(fromURL: FIREBASE_DATABASE_CHATS)
        
        //query and observe data changes
        chatsRef.queryLimited(toLast: 30).observe(.childAdded, with: { snapshot in
            
            if let object = snapshot.value as? NSDictionary{
                let user = object["user"] as! String
                let message = object["message"] as! String
                let userEnum : User = (user == "me") ? .me : .other
                self.chats.append(Chat(withUser: userEnum, message: message))
            }
            self.chatTable.reloadData()
            let lastIndexPath = NSIndexPath(row: self.chats.count - 1, section: 0)
            self.chatTable.scrollToRow(at: lastIndexPath as IndexPath, at: .bottom, animated: true)
        })
        
    }

    //MARK: Action
    @IBAction func sendChat(_ sender: Any) {
        
        if (self.chatTextField.text?.replacingOccurrences(of: " ", with: "").characters.count)! > 0{
            chatsRef.childByAutoId().setValue(["user": "me",
                                            "message": "\(self.chatTextField.text!)"])
            self.chatTextField.text = ""
            self.chatTextField.resignFirstResponder()
        }
        
    }
    

}
