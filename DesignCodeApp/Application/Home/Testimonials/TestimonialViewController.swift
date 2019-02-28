//
//  TestimonialViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/28/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel = TestimonialsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
}

extension TestimonialViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! TestimonialCollectionViewCell
        cell.viewModel = viewModel.item(indexPath: indexPath)
        return cell
    }
    

    
    
}
