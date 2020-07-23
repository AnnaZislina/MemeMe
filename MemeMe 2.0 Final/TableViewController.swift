//
//  TableViewController.swift
//  MeMe 1.0
//
//  Created by Anna Zislina on 17/06/2019.
//  Copyright © 2019 Anna Zislina. All rights reserved.
//

import UIKit

private let Identifier = "MemeTableViewCell"

class TableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appDelegate.meme.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        let memes = appDelegate.meme[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = memes.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedMem = appDelegate.meme[indexPath.row]
        
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.selectedMem = selectedMem
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
}

