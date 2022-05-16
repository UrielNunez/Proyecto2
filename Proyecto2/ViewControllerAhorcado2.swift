//
//  ViewControllerAhorcado2.swift
//  Proyecto2
//
//  Created by Omar Uriel Flores Nuñez on 15/05/22.
//

import UIKit

class ViewControllerAhorcado2: UIViewController {
    
    var second = 180
    var Tim = Timer()
    //var palabra = Palabra()
    var Oculta = ""
    var s = ""
    var acierto = 0
    var temp = ""
    var color = " "
    var pausar = false
    
    var nicPass = ""
    
    @IBOutlet weak var nick: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    @IBOutlet weak var NumAcierto: UILabel!
    @IBOutlet weak var palabraOculta: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func PulsarLetra(_ sender: UIButton) {
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
