//
//  MyTableViewCell.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/10/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterLabel: UILabel!
    
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    @IBOutlet weak var hairColorLabel: UILabel!
    
    @IBOutlet weak var homeWorldLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
