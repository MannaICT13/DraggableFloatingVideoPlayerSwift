//
//  DetailViewController.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: movieLayoutSection())
            collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "MovieCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func movieLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
         item.contentInsets.leading = 8
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [item])
         let section = NSCollectionLayoutSection(group: group)
         section.contentInsets.top = 8.0
         return section
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.thumbImage = videos[indexPath.item].thumbnail
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var urls: [NSURL] = []
        for video in videos {
            urls.append(NSURL(string: video.videoURL)!)
        }
        
        if YTFPlayer.getPlayerViewController() != nil {
            YTFPlayer.changeURLs(urls: urls)
        } else {
            YTFPlayer.initYTF(urls: urls, tableCellNibName: "VideoCell", delegate: PlayerDetailViewController().self, dataSource: PlayerDetailViewController().self)
            YTFPlayer.showYTFView(viewController: self)
        }
    }
}
