//
//  MovieCollectionViewCell.swift
//  AmberIT
//
//  Created by Khaled on 21/9/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var thumbImageView: UIImageView!
    @IBOutlet private weak var starRatingLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    
    var thumbImage: String? {
        didSet {
            guard let thumbImage = thumbImage else  {
                return
            }
            thumbImageView.image = UIImage(named: thumbImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 5.0
        starRatingLabel.font = .systemFont(ofSize: 9.0, weight: .semibold)
        yearLabel.font = .systemFont(ofSize: 9.0, weight: .medium)
    }
}
