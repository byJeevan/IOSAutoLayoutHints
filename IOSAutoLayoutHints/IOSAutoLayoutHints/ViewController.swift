//
//  ViewController.swift
//  IOSAutoLayoutHints
//
//  Created by Jeevan on 16/02/17.
//  Copyright © 2017 com.byjeevan. All rights reserved.
//

import UIKit
/*
 * Menu table view controller
 */
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var menuTable: UITableView!
    var menuItems:NSArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuItems = ["Center of a view", "2 views (Horizontal) center of screen", "2 views (Vertical) center of screen", "Fields of same width"]
        self.menuTable.delegate = self;
        self.menuTable.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.textLabel?.text = self.menuItems[Int(indexPath.row)] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(Utiliy.getViewControllerInstanceWithName(name: "LayoutId\(Int(indexPath.row))"), animated: true)
    }
}

