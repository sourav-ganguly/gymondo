//
//  ExerciseDetailVeriationTableViewCell.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import UIKit

class ExerciseDetailVeriationTableViewCell: UITableViewCell {
    @IBOutlet weak var variationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func configureWith(name: String) {
        variationLabel.text = name
    }
    
}
