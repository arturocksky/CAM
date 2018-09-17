//
//  AlertController+image.swift
//  CAM
//
//  Created by Arturo on 9/16/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit

extension UIAlertController{
    
    func addImage(image:UIImage){
        
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
        
    }
    
}
