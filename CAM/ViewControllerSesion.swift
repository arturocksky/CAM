//
//  ViewControllerSesion.swift
//  CAM
//
//  Created by Arturo on 8/16/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewControllerSesion: UIViewController {
    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var iniciarRegistrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if control.selectedSegmentIndex == 1 {
            iniciarRegistrar.setTitle("Registrarse", for: UIControlState.normal)
        }
    }

    @IBAction func entrar(_ sender: UIButton) {
        if control.selectedSegmentIndex == 0 {
            iniciarSesion(correo: correo.text!, password: password.text!)
        }else {
            registrarse(correo: correo.text!, password: password.text!)
        }
        
    }
    
    func iniciarSesion(correo: String, password: String){
        Auth.auth().signIn(withEmail: correo, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "sesionIniciada", sender: self)
            }else {
                if let error = error?.localizedDescription {
                    print("error firebase de inicio de sesión", error)
                }else {
                    print("error de código")
                }
            }
        }
    }
    
    func registrarse(correo: String, password: String){
        Auth.auth().createUser(withEmail: correo, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "sesionIniciada", sender: self)
            }else {
                if let error = error?.localizedDescription {
                    print("error firebase de registro", error)
                }else {
                    print("error de código")
                }
            }
        }
    }
    
}
