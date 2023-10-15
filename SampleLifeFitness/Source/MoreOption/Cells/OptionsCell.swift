//
//  OptionsCell.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 30/06/23.
//

import UIKit

class OptionsCell: UITableViewCell {

    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var optionsBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
//        optionsBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10);
//        optionsBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0);
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        setGradientBG()
    }
    
    func setGradientBG(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color1, Constants.color7]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        optionsView.layer.insertSublayer(gradientLayer, at:0)
        
    }
}
