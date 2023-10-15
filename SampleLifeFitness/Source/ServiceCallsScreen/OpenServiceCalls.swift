//
//  OpenServiceCalls.swift
//  SampleLifeFitness
//
//  Created by Nandhini Ezhilarasi on 01/07/23.
//

import UIKit

class OpenServiceCalls: UIViewController {
    
    var popUp: PopUpView?
    
    @IBOutlet weak var serviceDetailView: UIView!
    @IBAction func cancelPopUpBtn (_ sender: Any) {
        
        let popupView = PopUpView(frame: view.bounds)
        view.addSubview(popupView)
        self.popUp = popupView
        view.addSubview(popUp!)
//        let vc = storyboard?.instantiateViewController(identifier: "PopUpView") as? PopUpView
//        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
    @IBAction func moveToPartReqBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PartRequestScreen") as? PartRequestScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func moveToSerRepBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ServiceReportScreen") as? ServiceReportScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(popUp!)
    }
    
    override func viewDidLayoutSubviews() {
       // setUpUI()
    }

    func setUpUI(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color0, Constants.color1,  Constants.color2, Constants.color3, Constants.color4, Constants.color5, Constants.color6]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = serviceDetailView.bounds
        serviceDetailView.layer.insertSublayer(gradientLayer, at:0)
       
    }
}
