//
//  ExerciseDetailImageTableViewCell.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import UIKit
import Kingfisher

class ExerciseDetailImageTableViewCell: UITableViewCell {
    @IBOutlet weak var exerciseImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureWith(stringUrl: String) {
        exerciseImageView.kf.setImage(with: URL(string: stringUrl))
    }
    
}
