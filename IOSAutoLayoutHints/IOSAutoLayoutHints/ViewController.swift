//
//  ViewController.swift
//  IOSAutoLayoutHints
//
//  Created by Jeevan on 16/02/17.
//  Copyright © 2017 com.byjeevan. All rights reserved.
//

import UIKit
/*****************************************************
 ******     Menu table view controller    ***********
 ****************************************************
 
 1.Center of a view - Fixed w&h :
    - Width (constant) & Height (constant)
    - Center Horizontal in container
    - Center vertical in container
 
 ******************************************************
 
 2.Always retain Button @ bottom :
  + Button
    - Height (constant)
    - Leading, Trailing space to container
    - Bottom space to container
 
 ******************************************************
 
 3.A pair views (horizontal) are of same width in both orientation :
 + View 1
    - Vertical spacing to top layout guide
    - Horizontal spacing to top layout guide
    - Leading space to container margin
 + View 2
    - Vertical spacing to top layout guide
    - Horizontal spacing to top layout guide
    - Trailing space to container margin
 
 + View 1 <-> View 2
    - Equal width.
    - Horizontal spacing.
 
 ******************************************************
 4. Two Views with Complex Widths
 + View 1
 - Vertical spacing to top layout guide
 - Horizontal spacing to top layout guide
 - Leading space to container margin
 - Width (constant) >= XYZ
 
 + View 2
 - Vertical spacing to top layout guide
 - Horizontal spacing to top layout guide
 - Trailing space to container margin
 - Width equal to View 1 ,  Priority 750, Multiplier 2X
 
 + View 1 <-> View 2
 - Horizontal spacing.
 
 *******************************************************
 
 5. A pair views (vertical) are of same width in both orientation :
 + View 1
 - Vertical spacing to top layout guide
 - Horizontal spacing to top layout guide
 - Leading space to container margin
 + View 2
 - Vertical spacing to top layout guide
 - Vertical spacing to top layout guide
 - Trailing space to container margin
 
 + View 1 <-> View 2
 - Equal width.
 - Horizontal spacing.
 
 *****************************************************/


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var menuTable: UITableView!
    var menuItems:NSArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuItems = ["1. Center of a view - Fixed W & H",
                          "2. Always retain Button @ bottom ",
                          "3. A pair views are (horizontal) of same width in both orientation",
                          "4. Two Views with Complex Width",
                          "5. A pair views (vertical) are of same width in both orientation",
                          "6. Float view to left from Bottom when rotates landscape.",
                          "7. Button, Lable on top, Flexible image view",
                          "8. Stack view screen senario 1"
                       
        ]
        self.menuTable.delegate = self;
        self.menuTable.dataSource = self;
        
        let line:String? = readLine();
        
        print("We got \(line ?? "--")")
        
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
         cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(Utiliy.getViewControllerInstanceWithName(name:Utiliy.generateLayoutNameFromIndex(index: indexPath.row)), animated: false)
    }
}

