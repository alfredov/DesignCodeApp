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
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    private var chaptersViewModel = ChaptersViewModel()
    var isStatusBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        
        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        setStatusBarBackgroundColor(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
        isStatusBarHidden = false
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    func addBlurStatusBar() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let blur = UIBlurEffect(style: .light)
        let blurStatusBar = UIVisualEffectView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: statusBarHeight))
        blurStatusBar.effect = blur
        view.addSubview(blurStatusBar)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "HomeToChapterDetail" {
            let toViewController = segue.destination as! ChapterDetailViewController
            let indexPath = sender as! IndexPath
            toViewController.viewModel = chaptersViewModel.item(indexPath: indexPath)
            
            isStatusBarHidden = true
            UIView.animate(withDuration: 0.5) {
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY / 3)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 4)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 5)
        }
        
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [ChapterCollectionViewCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                let translationX = cellFrame.origin.x / 5
                cell.coverImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
        }
    }
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }

}

extension HomeViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chaptersViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChapterCollectionViewCell
        cell.viewModel = chaptersViewModel.item(indexPath: indexPath)
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HomeToChapterDetail", sender: indexPath)
    }
}
