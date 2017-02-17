//
//  ProfileViewController.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 18/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import SDWebImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileImageView.transformToRoundRect()
        self.getProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Function
    private func getProfile(){
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name,email,picture"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if error != nil{
                
            }else{
                
                if let objects = result as? NSDictionary{
                    
                    print(objects)
                    
                    if let picture = URL(string:"https://graph.facebook.com/\(objects["id"] as! String)/picture?type=large"){
                        self.profileImageView.sd_setImage(with: picture)
                    }
                    
                    if let name = objects["name"] as? String{
                        self.profileNameLabel.text = name
                    }
                    
                    if let email = objects["email"] as? String{
                        self.profileEmailLabel.text = email
                    }
                    
                }
                
                
            }
        })
    }
    

}
