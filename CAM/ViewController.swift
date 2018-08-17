//
//  ViewController.swift
//  CAM
//
//  Created by Arturo on 8/13/18.
//  Copyright © 2018 cam. All rights reserved.
//


import UIKit
import SidebarOverlay


class ViewController: SOContainerViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // var touch = false
        self.menuSide = .left
        self.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "inicio")
        self.sideViewController = self.storyboard?.instantiateViewController(withIdentifier: "leftMenu")
        self.title = "Inicio"
        let boton = UIButton(type: .custom)
      //   boton.setTitle("MENU", for: .normal)
        boton.setBackgroundImage(UIImage(named: "menu"), for: .normal)
        boton.showsTouchWhenHighlighted = true
        boton.setTitleColor(UIColor.blue, for: .normal)
        
     // boton.addTarget(self, action: #selector(hideMyMenu), for: .touchUpInside)
     //   boton.addTarget(self, action: #selector(hideMyMenu), for: .touchDownRepeat)
        boton.addTarget(self, action: #selector(showMyMenu), for: .touchUpInside)
        
        
        let botonBar = UIBarButtonItem(customView: boton)
        self.navigationItem.leftBarButtonItem = botonBar
        
        let image = UIImage(named: "logo-cam")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showMyMenu))
        
        //barButtonSystemItem: .add, target: self, action: #selector(showMyMenu))
    }
    
    @objc func showMyMenu () {
        if let container = self.so_containerViewController {
            if   container.isSideViewControllerPresented == false {
                container.isSideViewControllerPresented = true
            }
            
          //  if container.isSideViewControllerPresented == true {
                
           //     container.isSideViewControllerPresented = false
                
         //   }
            
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


