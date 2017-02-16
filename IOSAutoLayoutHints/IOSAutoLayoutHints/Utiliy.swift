//
//  Utillity.swift
//  IOSAutoLayoutHints
//
//  Created by Jeevan on 16/02/17.
//  Copyright © 2017 com.byjeevan. All rights reserved.
//

import Foundation
import UIKit

class Utiliy {
    
    public static func getViewControllerInstanceWithName(name:String) -> UIViewController  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: name)
    }
 
    public static func generateLayoutNameFromIndex(index:Int) -> String {
        return "LayoutId\(index)"
    }
}
