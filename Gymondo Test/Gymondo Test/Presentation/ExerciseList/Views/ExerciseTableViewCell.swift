//
//  ExerciseTableViewCell.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 8.0
    }
    
    func configureWith(viewModel: ExerciseCellViewModel) {
        titleLabel.text = viewModel.title
    }
    
}
