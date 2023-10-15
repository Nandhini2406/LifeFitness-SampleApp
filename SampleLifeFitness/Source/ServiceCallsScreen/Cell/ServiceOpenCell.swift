//
//  ServiceOpenCell.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 22/06/23.
//

import UIKit

class ServiceOpenCell: UICollectionViewCell {
    
    var buttonAction: (() -> ()) = {}

    
    @IBAction func openServiceBtn(_ sender: Any) {
        
        buttonAction()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        }
    
    override func layoutSubviews() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color0, Constants.color1,  Constants.color2, Constants.color3, Constants.color4, Constants.color5, Constants.color6]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at:0)
       
    }
    
}
