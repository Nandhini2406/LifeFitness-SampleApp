//
//  CreateRequestViewController.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 26/06/23.
//

import UIKit

class CreateRequest: UIViewController {

    @IBOutlet weak var serviceFormTableView: UITableView!
    @IBAction func backBtn(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpID()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Setup UI
    func setUpID(){
        
        self.serviceFormTableView.delegate = self
        self.serviceFormTableView.dataSource = self
        
        serviceFormTableView.register(UINib(nibName: "CreateRequestCell", bundle: nil), forCellReuseIdentifier: "CreateRequestCell")
    }

}


 // MARK: - TableView

extension CreateRequest: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateRequestCell", for: indexPath) as? CreateRequestCell
        return cell!
    }
    
}

