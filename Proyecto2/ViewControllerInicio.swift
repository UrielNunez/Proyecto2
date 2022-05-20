//
//  ViewControllerInicio.swift
//  Proyecto2
//
//  Created by Usuario on 19/05/22.
//

import UIKit

class ViewControllerInicio: UIViewController {

    var data = String()
    @IBOutlet weak var lblUsuario: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUsuario.text = data
        // Do any additional setup after loading the view.
    }
    

}
