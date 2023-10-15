//
//  PartRequestScreen.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 04/07/23.
//

import UIKit

class PartRequestScreen: UIViewController {
    


    @IBAction func backToServiceCallBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var partRequestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

    }
    
    func setUpUI(){
        
        partRequestTableView.register(UINib(nibName: "PartRequestTVCell", bundle: nil), forCellReuseIdentifier: "PartRequestTVCell")
        partRequestTableView.delegate = self
        partRequestTableView.dataSource = self
        
    }

}

// MARK: - TableView Delegate

extension PartRequestScreen: UITableViewDelegate , UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartRequestTVCell", for: indexPath) as? PartRequestTVCell
        return cell!
    }
    
    
    
    
}
