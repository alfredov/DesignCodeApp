//
//  ChapterSectionViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 11/13/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit

class ChapterSectionViewController: UIViewController {
    @IBOutlet weak var chapter1CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapter1CollectionView.delegate = self
        chapter1CollectionView.dataSource = self
    }

}

extension ChapterSectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chapterCell", for: indexPath) as! ChapterCollectionViewCell
        let section = sections[indexPath.row]
        cell.titleLabel.text = section["title"]
        cell.descriptionLabel.text = section["caption"]
        cell.coverImageView.image = UIImage(named: section["image"]!)
        return cell
    }
    
    
}
