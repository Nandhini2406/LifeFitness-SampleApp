//
//  ViewController.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 14/06/23.
//

import UIKit

class LoginPage: UIViewController {

    @IBOutlet weak var numberStackView: UIStackView!
    @IBAction func continueLoginButtonAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OtpScreen") as? OtpScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        bgSetup()
    }
    
    func bgSetup(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color0, Constants.color1,  Constants.color2, Constants.color3, Constants.color4, Constants.color5, Constants.color6]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 2.0)
        gradientLayer.frame = numberStackView.bounds
        numberStackView.layer.insertSublayer(gradientLayer, at:0)
    }

}
