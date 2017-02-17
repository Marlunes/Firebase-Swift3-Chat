//
//  Extensions.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 18/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit


extension UIImageView{

    public func transformToRoundRect(){
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }

}
