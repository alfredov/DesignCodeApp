//
//  TestimonialCollectionViewCell.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/28/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import UIKit

class TestimonialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var viewModel: TestimonialViewModel! {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        descriptionLabel.text = viewModel.description
        fullNameLabel.text = viewModel.fullName
        jobTitleLabel.text = viewModel.job
        avatarImageView.image = UIImage(named: viewModel.avatarFileName)
    }
}
