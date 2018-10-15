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
        // para que aparezca el teclado con "@"
        correo.keyboardType = .emailAddress
        correo.autocapitalizationType = .none
        // para que no se vea lo que ha tecleado el usuario
        password.isSecureTextEntry = true

        if control.selectedSegmentIndex == 1 {
            iniciarRegistrar.setTitle("Registrarse", for: UIControlState.normal)
        }
    }

    @IBAction func entrar(_ sender: UIButton) {
        
        var mensaje = ""
        //Validar correo
        if correo.text == "" {
            mensaje = "Ingresa un correo"
        }
        else {
            //validar que sea un correo valido
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let esValido = NSPredicate(format: "SELF MATCHES %@", regex)
            if !esValido.evaluate(with: correo.text){
                mensaje = "Correo no válido"
            }
            else if password.text == "" {
                mensaje = "Es necesario ingresar el password"
            }
        }
        if mensaje != "" {
            let mensajeError = UIAlertController(title: "Error", message:mensaje, preferredStyle: .alert);
            let deAcuerdo = UIAlertAction(title: "De acuerdo", style: .default, handler: nil);
            mensajeError.addAction(deAcuerdo);
            self.present(mensajeError, animated: true, completion: nil);
        }
        else {
            /*let ud = UserDefaults.standard
            ud.set(true, forKey:"SesionIniciada")
            ud.synchronize()
            self.performSegue(withIdentifier: "loginOK", sender: nil)*/
            if control.selectedSegmentIndex == 0 {
                iniciarSesion(correo: correo.text!, password: password.text!)
            }else {
                registrarse(correo: correo.text!, password: password.text!)
            }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
