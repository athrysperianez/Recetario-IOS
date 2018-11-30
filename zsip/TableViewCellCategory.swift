//
//  TableViewCellCategory.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 28/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit

class TableViewCellCategory: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var wallpaper: UIImageView!
    @IBOutlet weak var lblNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
