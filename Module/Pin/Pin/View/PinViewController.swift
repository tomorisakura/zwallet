//
//  PinViewController.swift
//  Pin
//
//  Created by MacBook on 27/05/21.
//

import UIKit

class PinViewController: UIViewController {

    @IBOutlet weak var pinFieldOne: UITextField!
    @IBOutlet weak var pinFieldTwo: UITextField!
    @IBOutlet weak var pinFieldThree: UITextField!
    
    @IBOutlet weak var pinFieldFour: UITextField!
    @IBOutlet weak var pinFieldFive: UITextField!
    @IBOutlet weak var pinFieldSix: UITextField!
    
    var presenter: PinPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
    @IBAction func confirmBtn(_ sender: Any) {
        let numOne = pinFieldOne.text ?? ""
        let numTwo = pinFieldTwo.text ?? ""
        let numThree = pinFieldThree.text ?? ""
        let numFour = pinFieldFour.text ?? ""
        let numFive = pinFieldFive.text ?? ""
        let numSix = pinFieldSix.text ?? ""
        
        let pin = numOne+numTwo+numThree+numFour+numFive+numSix
        presenter?.setPin(pin: pin)
    }
    
}
