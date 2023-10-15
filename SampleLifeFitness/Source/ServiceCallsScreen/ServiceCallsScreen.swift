//
//  ServiceCallsScreenViewController.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 22/06/23.
//

import UIKit

class ServiceCallsScreen : UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var servicecallsCV: UICollectionView!
    @IBOutlet weak var serviceSegCtrl: UISegmentedControl!
    @IBAction func moveToPartReqBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PartRequestScreen") as? PartRequestScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func moveToSerRepBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ServiceReportScreen") as? ServiceReportScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backToHomeBtn(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        segmentedCtrlDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
 // MARK: - Setup Methods
    func setUpUI(){
        
        self.servicecallsCV.delegate = self
        self.servicecallsCV.dataSource = self
        self.servicecallsCV.collectionViewLayout = UICollectionViewFlowLayout()
        
        view.addSubview(servicecallsCV)
        
        //to register nib in collectionView
        servicecallsCV.register(UINib(nibName: "ServiceOpenCell", bundle: nil), forCellWithReuseIdentifier: "ServiceOpenCell")
    }
    
    func segmentedCtrlDesign(){
        
        //to change segmentedContol text color
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        //to set Gradient color to segmented control
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Constants.color0, Constants.color1,  Constants.color2, Constants.color3, Constants.color4, Constants.color5, Constants.color6]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = serviceSegCtrl.bounds
        serviceSegCtrl.layer.insertSublayer(gradientLayer, at:0)

        
    }
    
}

// MARK: - CollectionView delegates

extension ServiceCallsScreen : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceOpenCell", for: indexPath) as? ServiceOpenCell
        cell?.buttonAction = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OpenServiceCalls") as? OpenServiceCalls
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = servicecallsCV.bounds.width
        let cellWidth = (collectionViewWidth - 20) / 2
        //let cellHeight = servicecallsCV.bounds.height
        return CGSize(width: cellWidth , height: 310)

    }
    
}
