//
//  Chat.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 18/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit

class Chat: NSObject {

    var user : User!
    var message: String!
    
    init(withUser user: User, message: String) {
        
        self.user = user
        self.message = message
        
    }
    
}

