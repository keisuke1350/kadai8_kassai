//
//  toDoTableViewCell.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/18.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class toDoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ImageTableView: UIImageView!
    @IBOutlet weak var LabelTableView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
