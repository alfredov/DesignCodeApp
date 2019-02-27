//
//  ChapterCollectionViewCell.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/27/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import UIKit

class ChapterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    var viewModel: ChapterViewModel! {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        titleLabel.text = viewModel.title
        captionLabel.text = viewModel.caption
        coverImageView.image = UIImage(named: viewModel.imageName)
    }
}
