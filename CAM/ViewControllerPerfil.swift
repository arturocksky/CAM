//
//  ViewControllerPerfil.swift
//  CAM
//
//  Created by Arturo on 8/16/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewControllerPerfil: UIViewController {
    @IBOutlet weak var correo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let email = Auth.auth().currentUser?.email {
            correo.text = String(email)
        }
        
    }

    
    @IBAction func salir(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "login", sender: self)
        
    }
    


}
