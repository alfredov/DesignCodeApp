//
//  QuotesViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 11/6/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {
    @IBOutlet weak var quotesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quotesCollectionView.delegate = self
        quotesCollectionView.dataSource = self
    }

}

extension QuotesViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quoteCell", for: indexPath) as! QuoteCollectionViewCell
        let quote = testimonials[indexPath.row]
        cell.textLabel.text = quote["text"]
        cell.nameLabel.text = quote["name"]
        cell.jobLabel.text = quote["job"]
        cell.avatarImageView.image = UIImage(named: quote["avatar"]!)
        return cell
    }
    
    
}
