//
//  TestimonialViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 11/2/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {

    @IBOutlet weak var testimonialCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testimonialCollectionView.delegate = self
        testimonialCollectionView.dataSource = self
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

extension TestimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! TestimonialCollectionViewCell
        let testimoial = testimonials[indexPath.row]
        cell.textLabel.text = testimoial["text"]
        cell.nameLabel.text = testimoial["name"]
        cell.jobLabel.text = testimoial["job"]
        cell.avatarImageView.image = UIImage(named: testimoial["avatar"]!)
        return cell
    }
    
    
}
