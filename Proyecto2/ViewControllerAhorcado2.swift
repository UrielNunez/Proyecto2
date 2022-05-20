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
    var palabra = Palabra()
    var Oculta = ""
    var string = ""
    var acierto = 0
    var temp = ""
    
    var nicPass = ""
    
    @IBOutlet weak var nick: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    @IBOutlet weak var NumAcierto: UILabel!
    @IBOutlet weak var palabraOculta: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
       nick.text = nicPass
       NumAcierto.text = "Aciertos : " + "\(acierto)"
       let (oculta) = palabra.CrearPalabraRandom(palabra:"")
       palabraOculta.text = palabra.crearLineas()
       Oculta = oculta

        
    }
    
    @objc func updateTime () {
        if second < 1{
                   Tim.invalidate()
                   let al = UIAlertController (title: "Se te acabo el Tiempo!!", message : nicPass + " Acertaste, FELICIDADES!! " + "\(acierto) " + "Palabras Acertadas!" , preferredStyle: .alert)

                   al.addAction(UIAlertAction (title : "OK" , style : .default , handler: {
                       action in
                    self.Tim.invalidate()
                  
                      self.navigationController?.popViewController(animated: true)

                   }))
                   self.present(al, animated : true)
               }else {
               second -= 1
            tiempo.text = formato (time : TimeInterval (second))
                    }
        
    }
    
     
    func formato(time : TimeInterval) -> String {
        let minutes = Int (time) / 60 % 60
        let seconds = Int (time) % 60
        return String(format : "%02i : %02i" , minutes , seconds)
    }
    

    
    
    func time (){
        Tim = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewControllerAhorcado2.updateTime)), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func PulsarLetra(_ sender: UIButton) {
        
        let le = sender.currentTitle!
         temp = palabraOculta.text!
        var va = palabra.comprobarLetra(letra: le  ,anterior: temp)
       //  ultimaPalabra(ultima: va)
        if va != temp{
        if va.contains("-"){
            palabraOculta.text = va
            palabraOculta.adjustsFontSizeToFitWidth = true
             print ("La letra que ha sido pausada" , va)
             
        }else{
            palabraOculta.text=va
            acierto += 1
            NumAcierto.text = "Aciertos : " +  "\(acierto)"
            Tim.invalidate()
            
            let alert = UIAlertController(title: "¡FELICIDADES ACERTASTE!" , message : nil , preferredStyle: .alert)
            /*
            let imagen = UIImage(named: "HOMERpng")
            
            let imagView = UIImageView (frame : CGRect (x : 10 , y : 50 , width: 250 , height: 230 ))
             imagView.image = imagen
            alert.view.addSubview(imagView)
           
           let height = NSLayoutConstraint (item : alert.view , attribute: .height , relatedBy: .equal , toItem: nil,attribute: .notAnAttribute , multiplier: 1 , constant: 320)
            let width = NSLayoutConstraint (item : alert.view , attribute: .width , relatedBy: .equal , toItem: nil,attribute: .notAnAttribute , multiplier: 1 , constant:250.0)
            
            alert.view.addConstraint(height)
            alert.view.addConstraint(width)
             */
            
            //alert.addAction(action)
            let action1 = UIAlertAction (title: "Seguir Jugando", style: .default, handler: {
                action in
                self.time()
                self.temp = va
                self.palabraOculta.text = ""
                let (pala) = self.palabra.CrearPalabraRandom(palabra: self.temp)
                self.ultimaPalabra(ultima: pala)
                self.palabraOculta.text=self.palabra.crearLineas()
                self.Oculta = pala
                self.imagen.image = nil
                self.view.layoutIfNeeded()
            })
            let action2 = UIAlertAction (title: "Finalizar Juego", style: .default, handler: {
                action in
                let al = UIAlertController (title: "Juego Terminado", message : self.nicPass + " Acertaste " + "\(self.acierto) " + "Palabras", preferredStyle: .alert)

                        al.addAction(UIAlertAction (title : "OK" , style : .default , handler: {
                           action in
                            self.Tim.invalidate()
                            
                            self.navigationController?.popViewController(animated: true)
                         
                            
                        }))
                        self.present(al, animated : true)
           
               
            })
            alert.addAction(action1)
            alert.addAction(action2)
          //  pruneNegativewidthConstraints()
            self.present (alert , animated : false)
        }
        }else{
            print("Esa letra no esta en la palabra", le)
         
                cargarImagen()
            
        }
        
    }
    
    
    
    func ultimaPalabra (ultima:String){
        if ultima == ""{
                
            let alert = UIAlertController(title: "WOW!, ACERTASTE TODAS LAS PALABRAS" , message :nicPass + "Has Acertado " + "\(acierto) " + "Palabras", preferredStyle: .alert)
                          
                           let action1 = UIAlertAction (title: "Ok", style: .default, handler: {
                            action in
                                           self.navigationController?.popViewController(animated: true)
                            
                          
                                       })
                                       alert.addAction(action1)
                                  
                                       self.present (alert , animated : false)
        
    }
    }
    
  
func cargarImagen (){
    if imagen.image == nil{
        imagen.image = UIImage (named : "base4")
    }else{
        if imagen.image == UIImage (named :"base4"){
            imagen.image = UIImage(named: "base5")
        }else if imagen.image == UIImage (named : "base5"){
            imagen.image = UIImage (named: "base6")
        }else if imagen.image == UIImage (named : "base6"){
            imagen.image = UIImage (named: "base7")
        }else if imagen.image == UIImage (named : "base7"){
            imagen.image = UIImage (named: "base8")
        }else if imagen.image == UIImage (named : "base8"){
            imagen.image = UIImage (named: "base9")
        }else if imagen.image == UIImage (named : "base9"){
            imagen.image = UIImage (named: "base10")
        
            
            
            let al = UIAlertController (title: "GAME OVER !!", message : nicPass + " Solo Has Acertado: " + "\(acierto) " + "palabra(s)", preferredStyle: .alert)

            al.addAction(UIAlertAction (title : "OK" , style : .default , handler: {
               action in
                self.Tim.invalidate()
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(al, animated : true)
        }
    }
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
