//
//  ViewController.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 17/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.current() != nil
        {
            // User is already logged in
        }
        
        let loginFB = FBSDKLoginButton()
        loginFB.center = self.view.center
        loginFB.readPermissions = [FB_PERMISSION_PUBLIC, FB_PERMISSION_EMAIL]
        loginFB.delegate = self
        self.view.addSubview(loginFB)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Facebook Login Button Delegate
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print(FB_LOGOUT)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
            if error != nil{
                Utility.presentAlertIn(self, title: ERROR, message: error.localizedDescription)
            }else if result.isCancelled {
                Utility.presentAlertIn(self, title: "", message: FB_LOGIN_CANCELED)
            }else {
                self.performSegue(withIdentifier: SEGUE_PROFILE, sender: self)
            }
        
    }
    

}

