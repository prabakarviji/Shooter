//
//  Link.swift
//  Shooter
//
//  Created by Spritle on 25/07/17.
//  Copyright © 2017 Spritle Mac. All rights reserved.
//

import Foundation
import UIKit

class Link {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
    }
    
}
