//
//  ViewControllerTicTacToe.swift
//  Proyecto2
//
//  Created by Usuario on 17/05/22.
//

import UIKit

class ViewControllerTicTacToe: UIViewController {
    
    enum Turno {
        case Nought
        case Cross
    }
    
    var puntajeCirculo = 0
    var puntajeEquis = 0
    
    @IBOutlet weak var lblTurno: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var primerTurno = Turno.Cross
    var turnoActual = Turno.Cross
    
    var CIRCULO = "O"
    var EQUIS = "X"
    var board = [UIButton]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        // Do any additional setup after loading the view.
    }
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func pulsarAction(_ sender: Any) {
        agregar(sender as! UIButton)
        
        if checkForVictory(EQUIS)
        {
            puntajeEquis += 1
            alertaResultado(title: "Equis Gana!")
        }
        
        if checkForVictory(CIRCULO)
        {
            puntajeCirculo += 1
            alertaResultado(title: "Circulo Gana!")
        }
        
        if(fullBoard())
        {
            alertaResultado(title: "Empate")
        }
    }
    
    func checkForVictory(_ s :String) -> Bool
    {
        // Victoria horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Victoria vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Victoria diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
        {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func alertaResultado(title: String)
    {
        let message = "\nCirculo " + String(puntajeCirculo) + "\n\nEquis " + String(puntajeEquis)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Resultado", style: .default, handler: {(_) in
            self.reiniciar()
        }))
        self.present(ac, animated: true)
    }
    
    func reiniciar()
    {
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if primerTurno == Turno.Nought
        {
            primerTurno = Turno.Cross
            lblTurno.text = EQUIS
        }
        else if primerTurno == Turno.Cross
        {
            primerTurno = Turno.Nought
            lblTurno.text = CIRCULO
        }
        turnoActual = primerTurno
    }
    
    func fullBoard() -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    func agregar(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(turnoActual == Turno.Nought){
                sender.setTitle(CIRCULO, for: .normal)
                turnoActual = Turno.Cross
                lblTurno.text = EQUIS
            }else if(turnoActual == Turno.Cross){
                sender.setTitle(EQUIS, for: .normal)
                turnoActual = Turno.Nought
                lblTurno.text = CIRCULO
            }
            sender.isEnabled = false
        }
    }
    

}
