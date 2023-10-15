//
//  MoreOption.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 26/06/23.
//

import UIKit

class MoreOption: UIViewController {

    @IBOutlet weak var rrLbl: UILabel!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBAction func backBtn(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Setup UI
    
    func setUpUI(){
        
        optionsTableView.register(UINib(nibName: "OptionsCell", bundle: nil), forCellReuseIdentifier: "OptionsCell")
        self.optionsTableView.delegate = self
        self.optionsTableView.dataSource = self
    }

}

// MARK: - TableView Methods

extension MoreOption: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsCell", for: indexPath) as? OptionsCell
        cell?.optionsBtn.setTitle(optionArr[indexPath.row], for: .normal)
        cell?.optionsBtn.setImage(UIImage(named: optionImg[indexPath.row]), for: .normal)
        
        return cell!
    }
    
    
    
    
}
