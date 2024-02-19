//
//  Video.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import Foundation

struct Video {
    var name: String
    var artist: String
    var description: String
    var videoURL: String
    var thumbnail: String
}

var videos: [Video] = [
    
    Video.init(name: "Manifest", artist: "JW-Platform", description: "When a plane mysteriously lands years after takeoff, the people onboard return to a world that has moved on without them and face strange new realities.", videoURL:  "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnail: "movie1"),
    
    Video.init(name: "Skate Phantom Flex", artist: "Brain Farm", description: "Bringing on Ty Evans was such a good idea for Brain Farm. Curt Morgan is changing the world of video as we know it. I would kill to work with these guys.", videoURL: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8", thumbnail: "movie2"),
    
    Video.init( name: "Big Bunny", artist: "Google", description: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license", videoURL: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8", thumbnail: "movie3"),
    
    Video.init( name: "Sintel", artist: "Blender Foundation", description: "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org", videoURL: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", thumbnail: "movie4"),
    
    Video.init( name: "Tears of Steel", artist: "Blender Foundation", description: "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org", videoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnail: "movie5"),
    
    Video.init( name: "Rendition Yoga", artist: "Multiresolution", description: "Yoga combines physical postures, breath control, and meditation for holistic well-being. Exercise enhances fitness and energy. Both contribute to overall health, promoting flexibility, strength, and mental clarity for a balanced lifestyle.", videoURL: "https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8", thumbnail: "movie6"),
    
    Video.init( name: "Healt Tips", artist: "Cloudfront", description: "Prioritize a balanced diet rich in fruits, vegetables, and whole grains. Limit processed foods and sugars. Stay hydrated. Portion control is key. Regular exercise and adequate sleep complement a healthy lifestyle.", videoURL: "https://diceyk6a7voy4.cloudfront.net/e78752a1-2e83-43fa-85ae-3d508be29366/hls/fitfest-sample-1_Ott_Hls_Ts_Avc_Aac_16x9_1280x720p_30Hz_6.0Mbps_qvbr.m3u8", thumbnail: "movie7"),
    
    Video.init( name: "Red Bull Flugtag", artist: "Redbull", description: "A quirky and entertaining event where teams build homemade, human-powered flying machines and launch them off piers into the water.", videoURL: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnail: "movie8"),
    
    Video.init( name: "Apple Event 2010",artist: "Apple", description: "The Apple Event 2010 showcased the iPhone 4 with a sleek design, Retina display, and FaceTime. iOS 4 introduced multitasking. The event also highlighted the MacBook Air's slim profile.", videoURL: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8", thumbnail: "movie9"),
    
    Video.init(name: "Lemon & Mint Juice", artist: "AFCDN", description: "Rejuvenate with a detoxifying blend of cucumber and mint.", videoURL: "https://assets.afcdn.com/video49/20210722/v_645516.m3u8", thumbnail: "movie10"),
    
    Video.init(name: "Face Dannykeane", artist: "Dannykeane", description: "Face cartoon show as like iOS sticker. For better resulation & show face.", videoURL: "https://res.cloudinary.com/dannykeane/video/upload/sp_full_hd/q_80:qmax_90,ac_none/v1/dk-memoji-dark.m3u8", thumbnail: "movie11")
]
