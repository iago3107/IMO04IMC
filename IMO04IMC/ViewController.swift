//
//  ViewController.swift
//  IMO04IMC
//
//  Created by Iago Jose on 13/10/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfweight: UITextField!
    @IBOutlet weak var tfheight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let peso = Double((tfweight.text!).replacingOccurrences(of: ",", with: ".")), let altura = Double((tfheight.text!).replacingOccurrences(of: ",", with: ".")) {
            imc = peso / (altura*altura)
            showResults()
        }
    }
    
    func showResults()  {
        var result: String = ""
        var imagem: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                imagem = "abaixo"
            case 16..<18.5:
                result = "abaixo do peso"
                imagem = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                imagem = "ideal"
            case 25..<30:
                result = "Sobre Peso"
                imagem = "sobre"
            default:
                result = "Obesidade"
                imagem = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: imagem)
        viResult.isHidden = false
        view.endEditing(true)
    }
}

