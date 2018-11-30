//
//  RecipeTableTableViewCell.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 30/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
