//
//  FirstTableViewCell.swift
//  MovieList
//
//  Created by nhi.luu on 06/12/2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static func nib() -> UINib{
        return UINib(nibName: "FirstTableViewCell", bundle: .main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
