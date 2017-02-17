//
//  Utility.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 17/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func presentAlertIn(_ view: UIViewController, title: String, message: String){
    
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: OK, style: .cancel, handler: { sender in})
        alertView.addAction(cancelButton)
        view.present(alertView, animated: true, completion: {})
        
    }
    
}
