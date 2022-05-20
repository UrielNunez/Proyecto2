//
//  ViewController.swift
//  Proyecto2
//
//  Created by Omar Uriel Flores Nuñez on 06/05/22.
//

import UIKit
let claseUsuario = ClaseUsuario()

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtPassC: UITextField!
    
    //Cambio de prueba

    override func viewDidLoad() {
        super.viewDidLoad()
        //PARA QUE NO APAREZCA EL BACK
        navigationItem.hidesBackButton = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irSegue"{
            print("Puedo enviar data")
            let passInfo = segue.destination as! ViewControllerInicio
            passInfo.data = txtUsuario.text ?? ""
            
            let nUsuario = Usuario(usuario: txtUsuario.text!, pass: txtPass.text!)
            claseUsuario.info.append(nUsuario)
        }
        else{
            print("no puedo enviar data")
        }
    }

    @IBAction func registrar(_ sender: Any) {
        if ((txtUsuario.text == "") || (txtPass.text == "") || (txtPassC.text == "")){
            print("Hay campos vacios")
        }
        else if txtPass.text != txtPassC.text{
            print("Las contraseñas no coinciden")
        }
        else{
            performSegue(withIdentifier: "irSegue", sender: self)
        }
    }
    
    
}

