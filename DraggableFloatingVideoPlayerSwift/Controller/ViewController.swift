//
//  ViewController.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    enum HomeCellType {
        case recentyAdded, recommandedForYou, bollywood, indianBangla, korean, animation, hollywood
    }
    
    var sections: [[HomeCellType]] {
        var recentyAdded = [HomeCellType]()
        var recommandedForYou = [HomeCellType]()
        var bollywood = [HomeCellType]()
        var indianBangla = [HomeCellType]()
        var korean = [HomeCellType]()
        var animation = [HomeCellType]()
        var hollywood = [HomeCellType]()
        
        for _ in 0..<videos.count {
            recentyAdded.append(contentsOf: [.recentyAdded])
            recommandedForYou.append(contentsOf: [.recommandedForYou])
            bollywood.append(contentsOf: [.bollywood])
            indianBangla.append(contentsOf: [.indianBangla])
            korean.append(contentsOf: [.korean])
            animation.append(contentsOf: [.animation])
            hollywood.append(contentsOf: [.hollywood])
        }
        return [recentyAdded, recommandedForYou, bollywood, indianBangla, korean, animation, hollywood]
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: movieLayoutSection())
            collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "MovieCollectionViewCell")
            collectionView.register(UINib(nibName: ReuseableHeaderView.identifier, bundle: nil),
                                    forSupplementaryViewOfKind: ReuseableHeaderView.kind,
                                    withReuseIdentifier: ReuseableHeaderView.identifier)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func  setupCollectionView() {
        
    }
    
    //    @IBAction func showPlayer(_ sender: UIButton) {
    //        var urls: [NSURL] = []
    //        for video in videos {
    //            urls.append(video.url)
    //        }
    //        YTFPlayer.initYTF(urls: urls, tableCellNibName: "VideoCell", delegate: self, dataSource: self)
    //        YTFPlayer.showYTFView(viewController: self)
    //    }
    
    func movieLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1)))
        item.contentInsets.leading = 8
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(1/2)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 8.0
        section.contentInsets.bottom = 8.0
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(18))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ReuseableHeaderView.kind, alignment: .topLeading)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.thumbImage = videos[indexPath.item].thumbnail
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case ReuseableHeaderView.kind:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseableHeaderView.identifier, for: indexPath) as! ReuseableHeaderView
            
            switch indexPath.section {
            case 0:
                header.title = "Recenty Added"
            case 1:
                header.title = "Recommanded For You"
                
            case 2:
                header.title = "Bollywood Movies"
            case 3:
                header.title = "Indian Bangla Movies"
            case 4:
                header.title = "Korean Movies"
            case 5:
                header.title = "Animation Movies"
                
            case 6:
                header.title = "Hollywood Movies"
                
            default: break
                
            }
            header.callback.didTappedMore = {[weak self] in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                self?.navigationController?.pushViewController(storyboard.instantiateViewController(withIdentifier: "DetailViewController"), animated: true)
            }
            return header
            
        default :
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var urls: [NSURL] = []
        for video in videos {
            urls.append(NSURL(string: video.videoURL)!)
        }
        YTFPlayer.initYTF(urls: urls, tableCellNibName: "VideoCell", delegate: self, dataSource: self)
        YTFPlayer.showYTFView(viewController: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath as IndexPath) as! VideoCell
        let model = videos[indexPath.row]
        cell.videoCellModel = .init(imageName: model.thumbnail, artist: model.artist, title: model.name)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        YTFPlayer.playIndex(index: indexPath.row)
    }
}

