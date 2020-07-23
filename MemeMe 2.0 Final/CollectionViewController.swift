//
//  CollectionViewController.swift
//  MeMe 1.0
//
//  Created by Anna Zislina on 17/06/2019.
//  Copyright © 2019 Anna Zislina. All rights reserved.
//

import UIKit

private let Identifier = "MemeCollectionViewCell"

class CollectionViewController: UICollectionViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //FlowLayout
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spaces: CGFloat = 3.0
        let dimensions = (view.frame.size.width - (2 * spaces)) / 3.0
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = spaces
            flowLayout.minimumLineSpacing = spaces
            flowLayout.itemSize = CGSize(width: dimensions, height: dimensions)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return appDelegate.meme.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath as IndexPath) as! MemeCollectionViewCell
        let meme = appDelegate.meme[indexPath.row]
        cell.memeImage.image = meme.memedImage
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let selectedMeme = appDelegate.meme[indexPath.row]
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.selectedMem = selectedMeme
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.meme
    }
    
}

