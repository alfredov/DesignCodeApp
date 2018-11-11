//
//  ChapterViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 11/8/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit

class ChapterViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    var section: [String: String]!
    var sections: [[String: String]]!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = section["title"]
        captionLabel.text = section["caption"]
        bodyLabel.text = section["body"]
        coverImageView.image = UIImage(named: section["image"]!)
        progressLabel.text = "\(indexPath.row + 1) / \(sections.count)"
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        print("Hey there!")
        dismiss(animated: true, completion: nil)
    }
}
