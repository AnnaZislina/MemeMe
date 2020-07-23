//
//  DetailViewController.swift
//  MeMe 1.0
//
//  Created by Anna Zislina on 17/06/2019.
//  Copyright © 2019 Anna Zislina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedMem: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedMem.memedImage
     
    }
}
