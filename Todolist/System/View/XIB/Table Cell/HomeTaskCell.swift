//
//  HomeTaskCell.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import UIKit

class HomeTaskCell: UITableViewCell {

    
    
    @IBOutlet weak var tasknamelbl: UILabel!
    @IBOutlet weak var selectedButton: UIButton!
    
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var taskcategoryimgview: UIImageView!
    @IBOutlet weak var tasktimelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code\\
        self.cellview.layer.cornerRadius = 10
        self.cellview.backgroundColor = UIColor.bg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
