//
//  ArtCollectionViewController.swift
//  DrawingProject
//
//  Created by Baugh, Tyler on 11/7/18.
//  Copyright © 2018 Baugh, Tyler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artIdentifier"

class ArtCollectionViewController: UICollectionViewController
{

    
    //MARK: Data members for Creativity Screen
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
    {
        return [
            UIImage(named: "Lucina"),
            UIImage(named: "smultimate"),
            UIImage(named: "mountainPainting"),
            UIImage(named: "TylerBaughJavaHaiku"),
            UIImage(named: "TylerBaughMainframeHaiku"),
            UIImage(named: "TylerBaughSwiftHaiku"),
            UIImage(named: "TylerBaughOctocat")
        ]
    }()
    
    private let labels : [String] =
    {
        return [
        "Lucina",
        "Super Smash Bros. Ultimate",
        "Mountain Painting",
        "Java Haiku",
        "Mainframe Haiku",
        "Swift Haiku",
        "My Octocat",
        ]
    }()
    
    //MARK: - Lifecycle
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    
    // MARK: - Navigation


 public override func numberOfSections(in collectionView: UICollectionView) -> Int
 {
 return 1
 }
 
 
 public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
 {
 return creativeCS.count
 }
    
    // MARK: UICollectionViewDataSource

    
    public override func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .blue
        artCell.artImage.image = creativeCS[indexPath.row]
        artCell.artLabel.text = labels[indexPath.row]
        
        return artCell
    }

    // MARK: UICollectionViewDelegate

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let paddingSpace = sectionInsets.left * (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
     {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
     {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool
     {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool
     {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)
     {
    
    }
    */

}
