//
//  HomeViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 11/5/18.
//  Copyright © 2018 Alfredo Villagomez. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapterCollectionView.dataSource = self
        chapterCollectionView.delegate = self

        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToChapter" {
            let toViewController = segue.destination as! ChapterViewController
            let indexPath = sender as! IndexPath
            let section = sections[indexPath.row]
            toViewController.sections = sections
            toViewController.section = section
            toViewController.indexPath = indexPath
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        let url = URL(string: urlString)
        let player = AVPlayer(url: url!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chapterCell", for: indexPath) as! ChapterCollectionViewCell
        let chapter = sections[indexPath.row]
        cell.titleLabel.text = chapter["title"]
        cell.descriptionLabel.text = chapter["caption"]
        cell.coverImageView.image = UIImage(named: chapter["image"]!)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HomeToChapter", sender: indexPath)
    }
    
    
}
