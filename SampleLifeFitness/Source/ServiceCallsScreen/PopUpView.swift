//
//  PopUpView.swift
//  SampleLifeFitness
//
//  Created by Nandhini Ezhilarasi on 02/07/23.
//

import UIKit

class PopUpView: UIView {
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cancelPopView: UIView!
    
    var yesBtnAction: (() ->())?
    var noBtnAction: (() ->())?
    

    @IBAction func yesBtnTapped(_ sender: Any) {
       removeFromSuperview()
    }
    
    @IBAction func noBtnTapped(_ sender: Any) {
            removeFromSuperview()
    }
    
//    override init(frame: CGRect) {
//           super.init(frame: frame)
//           commonInit()
//       }
//       
//       required init?(coder aDecoder: NSCoder) {
//           super.init(coder: aDecoder)
//           commonInit()
//       }
//    
//    private func commonInit() {
//           Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)
//
//           contentView.frame = bounds
//           addSubview(contentView)
//       }
    
//    func xibSetUp(frame: CGRect){
//        self.view = loadNibView()
//        view.frame = frame
//        self.addSubView(view)
//    }
//
//    func loadNibView() -> UIView{
//
//        let nib = UINib(nibName: "PopUpView", bundle: nil)
//        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
//        return view
//    }
//

       
}
