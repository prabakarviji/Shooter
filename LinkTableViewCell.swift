//
//  LinkTableViewCell.swift
//  Shooter
//
//  Created by Spritle on 25/07/17.
//  Copyright © 2017 Spritle Mac. All rights reserved.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
    
    
    //MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
