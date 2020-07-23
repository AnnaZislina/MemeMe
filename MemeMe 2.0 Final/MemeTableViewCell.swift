//
//  MemeTableViewCell.swift
//  MeMe 1.0
//
//  Created by Anna Zislina on 17/06/2019.
//  Copyright © 2019 Anna Zislina. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

