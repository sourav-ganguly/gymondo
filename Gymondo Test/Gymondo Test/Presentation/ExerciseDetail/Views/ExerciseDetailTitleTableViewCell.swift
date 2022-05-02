//
//  ExerciseDetailTitleTableViewCell.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import UIKit

class ExerciseDetailTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureWith(title: String) {
        titleLabel.text = title
    }
    
}
