//
//  ViewController.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import UIKit

class ViewController: UIViewController {
    let videos = [Video.init(name: "Big Bunny", artist: "Google", 
                             url: NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")!),
                  Video.init(name: "Robo Toy", artist: "Google", 
                             url: NSURL(string: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8")!),
                  Video.init(name: "Big Bunny", artist: "Google", 
                             url: NSURL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!),
                  Video.init(name: "Robo Toy", artist: "Google", 
                             url: NSURL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!),
                  Video.init(name: "Big Bunny", artist: "Google", 
                             url: NSURL(string: "https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showPlayer(_ sender: UIButton) {
        var urls: [NSURL] = []
        for video in videos {
            urls.append(video.url)
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
        cell.imageThumbnail.image = UIImage(resource: .bigBunny)
        cell.labelArtist.text = videos[indexPath.row].artist
        cell.labelTitle.text = videos[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        YTFPlayer.playIndex(index: indexPath.row)
    }
}
