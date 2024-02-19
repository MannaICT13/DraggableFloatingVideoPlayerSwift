//
//  ReuseableHeaderView.swift
//  AmberIT
//
//  Created by Khaled on 21/9/23.
//

import UIKit

extension ReuseableHeaderView {
    class Callback {
        var didTappedMore: () -> Void = { }
    }
}

class ReuseableHeaderView: UICollectionReusableView {
    static let identifier = "ReuseableHeaderView"
    static let kind = "ElementKind"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var moreButtonOutlet: UIButton!
    
    var callback = Callback()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isMoreHidden: Bool? {
        didSet {
            moreButtonOutlet.isHidden = isMoreHidden ?? false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .systemFont(ofSize: 15.0, weight: .medium)
    }
    
    @IBAction private func didTappedMore(_ sender: UIButton) {
        callback.didTappedMore()
    }
}
