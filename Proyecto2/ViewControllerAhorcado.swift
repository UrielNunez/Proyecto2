//
//  ViewControllerAhorcado.swift
//  Proyecto2
//
//  Created by Omar Uriel Flores Nuñez on 15/05/22.
//

import UIKit

class ViewControllerAhorcado: UIViewController {
    
    @IBOutlet weak var nickJugador: UITextField!
    var nick = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Empezar(_ sender: UIButton) {
        if !(nickJugador.text?.isEmpty ?? true){
                 nick = nickJugador.text!
                  performSegue(withIdentifier: "PassInfo", sender: self)
                     
         }else{
             
             let al = UIAlertController (title: "Error", message :"No ha ingresado ningun Nombre" , preferredStyle: .alert)

             al.addAction(UIAlertAction (title : "OK" , style : .default , handler: nil))
           
             self.present(al,animated: true)
         }
    }
    

    
    // MARK: - NavigatioN
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let PassInfo = segue.destination as! ViewControllerAhorcado2
        PassInfo.nicPass = nick
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           return textField.resignFirstResponder()
        
       }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
