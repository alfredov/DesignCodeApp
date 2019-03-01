//
//  ChapterDetailViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/28/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import UIKit

class ChapterDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var viewModel: ChapterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel.title
        captionLabel.text = viewModel.caption
        coverImageView.image = UIImage(named: viewModel.imageName)
        progressLabel.text = viewModel.progress
        bodyLabel.text = viewModel.body
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
