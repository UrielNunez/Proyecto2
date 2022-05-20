//
//  LoginViewController.swift
//  Proyecto2
//
//  Created by Usuario on 19/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    var usuario:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func entrar(_ sender: Any) {
        if(txtUsuario.text != "" && txtPass.text != ""){
            
        }
    }
    
}
    
