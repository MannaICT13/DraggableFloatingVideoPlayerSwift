//
//  PlayerDetailViewController.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import Foundation
import UIKit

class PlayerDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath as IndexPath) as! VideoCell
        let model = videos[indexPath.row]
        cell.videoCellModel = .init(imageName: model.thumbnail, artist: model.artist, title: model.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        YTFPlayer.playIndex(index: indexPath.row)
    }
}
