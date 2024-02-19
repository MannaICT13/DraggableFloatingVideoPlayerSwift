//
//  VideoCell.swift
//  YouTubeFloatingPlayer
//
//  Created by Ana Paula on 6/8/16.
//  Copyright © 2016 Ana Paula. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    @IBOutlet private weak var imageThumbnail: UIImageView!
    @IBOutlet private weak var labelArtist: UILabel!
    @IBOutlet private weak var labelTitle: UILabel!
    
    var videoCellModel: VideoCellModel? {
        didSet {
            guard let model = videoCellModel else { return }
            imageThumbnail.image = UIImage(named: model.imageName)
            labelArtist.text = model.artist
            labelTitle.text = model.title
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct VideoCellModel {
    let imageName:String
    let artist: String
    let title: String
}
