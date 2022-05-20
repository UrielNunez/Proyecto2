//
//  Palabras.swift
//  Proyecto2
//
//  Created by Omar Uriel Flores Nuñez on 18/05/22.
//

import Foundation
class Palabra {
    var oculta = ""
    var palabraOculta = ["ANA", "OSO", "NADAN" , "OJO" , "RAJAR" , "RAYAR" ,"SOLOS","RAPAR" ,"ROTOMOTOR" , "RECONOCER" , "CAYAC", "ORO"]
    var string = ""
   
    
    func CrearPalabraRandom(palabra : String)->(String){
        var randomName = ""
        palabraOculta = EliminarPalabra(elimina: palabra, lista: palabraOculta)
      
            if !palabraOculta.isEmpty {
            randomName = palabraOculta.randomElement()!
            oculta = randomName
            }else{
                oculta = ""
        }
          
         return (oculta)
        
    }

    
    func crearLineas ()->String{
    var i = 0
        if !string.isEmpty{
            string = ""
        }
        while (i < oculta.count){
            string += "-"
        i += 1
     }
        return string
    }
    
    
    
    func comprobarLetra ( letra : String, anterior : String)->(String){
         var ant = anterior
     
        for item in 0..<oculta.count{
           
            let pal = oculta.index(oculta.startIndex, offsetBy: item)
            let r = oculta[pal]
            if  r == Character.init(letra) {
                ant = remplazaLineas(offset: item , le: letra)
            }
        
        }
            return ant
    }


    func remplazaLineas (offset : Int, le : String ) -> String{
       // var temp = anterior
        let index = string.index (string.startIndex , offsetBy: offset)
        let range = index...index
        string.replaceSubrange(range, with: le)
        
        return string
    }

    
    func EliminarPalabra (elimina : String ,lista:[String])->[String]{

        let pal = lista.filter{ $0 != elimina}
              return pal
                   
        }
    
    

}
