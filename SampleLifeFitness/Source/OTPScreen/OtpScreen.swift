//
//  OPTViewController.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 15/06/23.
//

import UIKit
import SVPinView

class OtpScreen: UIViewController {
    
    
    @IBOutlet weak var pinView: SVPinView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
                
    }
    
    func setUpUI(){
        
        pinView.fieldCornerRadius = 5
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color0, Constants.color1,  Constants.color2, Constants.color3, Constants.color4, Constants.color5, Constants.color6]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 2.0)
        gradientLayer.frame = pinView.frame
        
  //   pin .layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    
    @IBAction func editButtonAction(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func buttonToHome(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "TabBarViewController") as? TabBarViewController
        self.navigationController?.pushViewController(vc! , animated: true)
    }
    
//    @IBAction func textFieldAction(_ sender: Any) {
//
//        //let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard?.instantiateViewController(identifier: "TabBarViewController") as? TabBarViewController
//        self.navigationController?.pushViewController(vc! , animated: true)
//
//    }
    
}
