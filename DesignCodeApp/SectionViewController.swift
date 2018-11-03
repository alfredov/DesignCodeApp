//
//  SectionViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 10/31/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var section: [String: String]!
    var sections: [[String: String]]!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titlelabel.text = section["title"]
        captionLabel.text = section["caption"]
        bodyLabel.text = section["body"]
        coverImageView.image = UIImage(named: section["image"]!)
        progressLabel.text = "\(indexPath.row + 1) / \(sections.count)"
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
