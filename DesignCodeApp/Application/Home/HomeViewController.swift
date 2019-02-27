//
//  HomeViewController.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/26/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
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
