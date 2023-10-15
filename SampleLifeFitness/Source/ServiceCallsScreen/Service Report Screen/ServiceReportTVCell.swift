//
//  ServiceReportTVCell.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 04/07/23.
//

import UIKit

class ServiceReportTVCell: UITableViewCell {

    @IBOutlet weak var serviceCallNumberLbl: UILabel!
    @IBOutlet weak var serviceEngineerNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var reportNumberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
