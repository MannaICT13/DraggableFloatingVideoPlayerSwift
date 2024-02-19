//
//  YTFPlayer.swift
//  DraggableFloatingVideoPlayerSwift
//
//  Created by Khaled-iOS on 19/2/24.
//

import UIKit
import Foundation

public struct YTFPlayer {
    public static func initYTF(url: NSURL, tableCellNibName: String, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        if (dragViewController == nil) {
            dragViewController = YTFViewController(nibName: "YTFViewController", bundle: nil)
        }
        dragViewController?.urls = [url]
        dragViewController?.delegate = delegate
        dragViewController?.dataSource = dataSource
        dragViewController?.tableCellNibName = tableCellNibName
    }
    
    public static func initYTF(urls: [NSURL], tableCellNibName: String, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        if (dragViewController == nil) {
            dragViewController = YTFViewController(nibName: "YTFViewController", bundle: nil)
        }
        dragViewController?.urls = urls
        dragViewController?.delegate = delegate
        dragViewController?.dataSource = dataSource
        dragViewController?.tableCellNibName = tableCellNibName
    }
    
    public static func showYTFView(viewController: UIViewController) {
        if dragViewController!.isOpen == false {
            dragViewController!.view.frame = CGRectMake(viewController.view.frame.size.width, viewController.view.frame.size.height, viewController.view.frame.size.width, viewController.view.frame.size.height)
            dragViewController!.view.alpha = 0
            dragViewController!.view.transform = CGAffineTransformMakeScale(0.2, 0.2)
            dragViewController!.onView = viewController.view
            
            UIApplication.shared.keyWindowInConnectedScenes?.addSubview(dragViewController!.view)
            
            UIView.animate(withDuration: 0.5, animations: {
                dragViewController!.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                dragViewController!.view.alpha = 1
                
                dragViewController!.view.frame = CGRectMake(0, 0, UIApplication.shared.keyWindowInConnectedScenes!.bounds.width, UIApplication.shared.keyWindowInConnectedScenes!.bounds.height)
                
                dragViewController!.isOpen = true
            })
        }
    }
    
    public static func getPlayerViewController() -> UIViewController? {
        return dragViewController
    }
    
    public static func changeURL(url: NSURL) {
        dragViewController?.urls = [url]
    }
    
    public static func changeURLs(urls: [NSURL]) {
        dragViewController?.urls = urls
    }
    
    public static func changeCurrentIndex(index: Int) {
        dragViewController?.currentUrlIndex = index
    }
    
    public static func playIndex(index: Int) {
        dragViewController?.currentUrlIndex = index
        dragViewController?.playIndex(index: index)
        dragViewController?.hidePlayerControls(dontAnimate: true)
    }
    
    public static func getIndex() -> Int {
        return dragViewController!.currentUrlIndex
    }
    
    public static func isOpen() -> Bool {
        return dragViewController?.isOpen == true ? true : false
    }
    
    public static func getYTFViewController() -> UIViewController? {
        return dragViewController
    }
    
    public static func finishYTFView(animated: Bool) {
        if(dragViewController != nil) {
            dragViewController?.isOpen = false
            dragViewController?.finishViewAnimated(animated: animated)
            dragViewController = nil
        }
    }
}

var dragViewController: YTFViewController?
